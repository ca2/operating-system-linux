#include "framework.h"
//#include "apex/xml/_.h"
#include "acme/id.h"
//#include "_linux.h"
#undef USE_MISC

#ifdef RASPBIAN
#include <sys/types.h>
#include <unistd.h>
#endif


inline bool linux_dir_myspace(char ch)
{

   return ch == ' ' ||
          ch == '\t' ||
          ch == '\r' ||
          ch == '\n';

}


::file::path xdg_get_dir(::matter * pmatter, string str)
{

   ::file::path pathHome;

   pathHome = getenv("HOME");

   ::file::path path;

   path = pathHome / ".config/user-dirs.dirs";

   auto straLines = pmatter->m_psystem->m_pacmefile->lines(path);

   string strPrefix = str + "=";

   straLines.filter_begins_ci(strPrefix);

   if(straLines.get_size() != 1)
   {

      return "";

   }

   path = straLines[0];

   ::str::begins_eat_ci(path, strPrefix);

   path.replace("$HOME", pathHome);

   path.trim("\"");

   return path;

}


namespace linux
{


   dir_context::dir_context()
   {


   }


   dir_context::~dir_context()
   {


   }


   ::e_status dir_context::initialize(::object * pobject)
   {

      auto estatus = ::object::initialize(pobject);

      if (!estatus)
      {

         return estatus;

      }

      auto psystem = m_psystem;

      __refer(m_pfilesystem, psystem->m_papexsystem->m_pfilesystem.get());

      __refer(m_pdirsystem, psystem->m_papexsystem->m_pdirsystem.get());

      return ::success;

   }


   ::e_status dir_context::init_system()
   {

      if(!::dir_context::init_system())
      {

         return false;

      }

      auto pathCa2 = ca2module();

      pathCa2.go_up(3);

      m_pdirsystem->m_pathCa2 = pathCa2;

//      auto pdocument = create_xml_document();
//
//      pdocument->load(pcontext->m_papexcontext->file().as_string(appdata() /"configuration\\directory.xml"));
//
//      if(pdocument->root() && pdocument->root()->get_name() == "directory_configuration")
//      {
//
//         m_pdirsystem->m_pathTimeFolder = pdocument->root()->get_child_value("time");
//
//         m_pdirsystem->m_pathNetSeedFolder = pdocument->root()->get_child_value("netseed");
//
//      }

#ifdef LINUX

      m_pdirsystem->m_pathTimeFolder = "/var/tmp/ca2/time";

#else

      if(m_pdirsystem->m_pathTimeFolder.is_empty())
      {

         m_pdirsystem->m_pathTimeFolder = appdata() / "time";

      }

#endif

      if(m_pdirsystem->m_pathNetSeedFolder.is_empty())
      {

         m_pdirsystem->m_pathNetSeedFolder = install() / "netd";

      }

      mk(m_pdirsystem->m_pathTimeFolder);

      if(!is(m_pdirsystem->m_pathTimeFolder))
      {

         return false;

      }

      mk(m_pdirsystem->m_pathTimeFolder / "time");

      ::file::path pathHome = getenv("HOME");

      string pathInstall;

      pathInstall = install();

      index iFind = pathInstall.find(':');

      if(iFind >= 0)
      {

         strsize iFind1 = pathInstall.reverse_find("\\", iFind);

         strsize iFind2 = pathInstall.reverse_find("/", iFind);

         strsize iStart = maximum(iFind1 + 1, iFind2 + 1);

         pathInstall = pathInstall.Left(iFind - 1) + "_" + pathInstall.Mid(iStart, iFind - iStart) + pathInstall.Mid(iFind + 1);

      }

      return true;

   }


   ::e_status dir_context::init_context()
   {

      auto estatus = ::dir_context::init_context();

      if(!estatus)
      {

         return estatus;

      }

      return estatus;

   }


   ::file::listing & dir_context::root_ones(::file::listing & listing)
   {

      listing.add("/");

      listing.m_straTitle.add("Filesystem");

      return listing;

   }


   ::file::listing & dir_context::ls(::file::listing & listing)
   {

      if(::dir_context::ls(listing).succeeded())
      {

         return listing;

      }

      if(listing.m_bRecursive)
      {

         index iStart = listing.get_count();

         {

            __scoped_restore(listing.m_pathUser);

            __scoped_restore(listing.m_pathFinal);

            __scoped_restore(listing.m_eextract);

            ::file::listing straDir;

            ls_dir(straDir, listing.m_pathFinal);

            for(i32 i = 0; i < straDir.get_count(); i++)
            {

               string strDir = straDir[i];

               if(strDir == listing.m_pathFinal)
               {

                  continue;

               }

               if(listing.m_bDir)
               {

                  ::file::path & path = listing.add_get(::file::path(strDir));

                  path.m_iSize = 0;

                  path.m_iDir = 1;

               }

               get_application()->dir().ls(listing, strDir);

            }

         }

         if(listing.m_bFile)
         {

            __scoped_restore(listing.m_bRecursive);

            listing.m_bRecursive = false;

            get_application()->dir().ls_file(listing, listing.m_pathFinal);

         }

         for(index i = iStart; i < listing.get_size(); i++)
         {

            listing[i].m_iRelative = listing.m_pathFinal.get_length() + 1;

         }

      }
      else
      {

         ::file::patha stra;

         m_psystem->m_pacmedir->ls(stra, listing.m_pathFinal);

         for(i32 i = 0; i < stra.get_count(); i++)
         {

            auto & strPath = stra[i];

            if(!::str::begins(strPath, listing.m_pathFinal))
               continue;

            bool bIsDir;

            if(strPath.m_iDir >= 0)
            {

               bIsDir = strPath.m_iDir != 0;

            }
            else
            {

               bIsDir = ::dir_context::is(strPath);

            }

            if((bIsDir && !listing.m_bDir) || (!bIsDir && !listing.m_bFile))
               continue;

            if(!bIsDir && !matches_wildcard_criteria(listing.m_straPattern, strPath.name()))
               continue;

            ::file::path & path = listing.add_get(strPath);

            path.m_iDir = bIsDir ? 1 : 0;

            if(bIsDir)
            {

               path.m_iSize = 0;

            }
            else
            {

               path.m_iSize = m_psystem->m_pacmefile->get_size(strPath);

            }

         }

      }

      return listing;

   }


   bool dir_context::is(const ::file::path & path)
   {

      if(m_psystem->m_pacmedir->is(path))
      {

         return true;

      }

      bool bIsDir = m_psystem->m_pacmedir->_is(path);

      return bIsDir;

   }


   bool dir_context::name_is(const ::file::path & str)
   {
      //output_debug_string(str);
      strsize iLast = str.get_length() - 1;
      while(iLast >= 0)
      {
         if(str[iLast] != '\\' && str[iLast] != '/' && str[iLast] != ':')
            break;
         iLast--;
      }
      while(iLast >= 0)
      {
         if(str[iLast] == '\\' || str[iLast] == '/' || str[iLast] == ':')
            break;
         iLast--;
      }
      if(iLast >= 0)
      {
         while(iLast >= 0)
         {
            if(str[iLast] != '\\' && str[iLast] != '/' && str[iLast] != ':')
            {
               iLast++;
               break;
            }
            iLast--;
         }
      }
      else
      {
         return true; // assume empty string is root_ones directory
      }

      if(task_flag().is_set(e_task_flag_compress_is_dir) && iLast >= 3  && !ansi_count_compare_ci(&((const char *) str)[iLast - 3], ".zip", 4))
      {

         return true;

      }

      wstring wstrPath;

      wstrPath = ::str::international::utf8_to_unicode(str, iLast + 1);

      bool bIsDir = ::dir_context::is(::str::international::unicode_to_utf8(wstrPath));

      return bIsDir;

   }


   ::file::path dir_context::time()
   {

      return m_pdirsystem->m_pathTimeFolder;

   }


   ::file::path dir_context::element_commonappdata(const string & strElement)
   {

      return ::file::path(strElement) / "commonappdata";

   }


   ::file::path dir_context::stage()
   {

      return install() / "stage";

   }


   ::file::path dir_context::stageapp()
   {

      return stage() / "basis";

   }


   ::file::path dir_context::netseed()
   {

      return m_pdirsystem->m_pathNetSeedFolder;

   }


   ::file::path dir_context::time_square()
   {

      return time() / "time";

   }


   ::file::path dir_context::time_log(const string & pszId)
   {

      ::file::path strLogBaseDir;

      strLogBaseDir = appdata() / "log";

      return strLogBaseDir / pszId;

   }


   bool dir_context::mk(const ::file::path & pcsz)
   {

      if(is(pcsz))
      {

         return true;

      }

      ::file::patha stra;

      pcsz.ascendants_path(stra);

      index i = stra.get_upper_bound();

      for(; i >= 0; i--)
      {

         if(is(stra[i]))
         {

            i++;

            break;

         }

      }

      if(i < 0)
      {

         return false;

      }

      for(; i < stra.get_size(); i++)
      {

         if(!m_psystem->m_pacmedir->create_directory(stra[i]))
         {

            ::e_status estatus = ::get_last_status();

            if(estatus == ::error_already_exists)
            {

               string str;

               str = stra[i];

               str.trim_right("\\/");

               auto pcontext = m_pcontext;

               try
               {

                  pcontext->m_papexcontext->file().del(str);

               }
               catch(...)
               {

               }

               str = stra[i];

               str.trim_right("\\/");

               try
               {

                  pcontext->m_papexcontext->file().del(str);

               }
               catch(...)
               {

               }

               if(m_psystem->m_pacmedir->create_directory(stra[i]))
               {

               }
               else
               {

                  estatus = ::get_last_status();

               }

            }

            char * pszError;

            if(!is(stra[i]))
            {

               return false;

            }

         }

      }

      return true;

   }


   bool dir_context::rm(const ::file::path & path, bool bRecursive)
   {

      if(bRecursive)
      {

         ::file::listing listing;

         ls(listing, path);

         for(auto & pathItem : listing)
         {

            if(is(pathItem))
            {

               rm(pathItem, true);

            }
            else
            {

               ::unlink(pathItem);

            }

         }

      }

      return ::rmdir(path) != false;

   }


   ::file::path dir_context::trash_that_is_not_trash(const ::file::path & psz)
   {

      if(psz[1] == ':')
      {

         string strDir = psz.name();
         string str;
         str = strDir.Left(2);
         str += "\\trash_that_is_not_trash\\";
         string strFormat;
         ::datetime::time time;
         time = ::datetime::time::now();
         strFormat.format("%04d-%02d-%02d %02d-%02d-%02d\\", time.year(), time.month(), time.day(), time.hour(), time.minute(), time.second());
         str += strFormat;
         if(strDir[2] == '\\')
         {
            str += strDir.Mid(3);
         }
         else
         {
            str += strDir.Mid(2);
         }
         return str;
      }

      return "";

   }


//   ::file::path dir_context::appdata()
//   {
//
//      return ::dir_context::appdata();
//
//   }


   ::file::path dir_context::commonappdata()
   {

      ::file::path path;

      path = ::file::path(getenv("HOME")) / ".config/ca2/commonappdata";

      string strRelative;

      strRelative = install();

      return path / "ca2" / strRelative;

   }


   ::file::path dir_context::userquicklaunch(::object * pobject)
   {

      ::file::path path;

      path = ::file::path(getenv("HOME")) / "Microsoft\\Internet Explorer\\Quick Launch";

      return path;

   }


   ::file::path dir_context::userprograms(::object * pobject)
   {

      ::file::path path;

      path = "/usr/bin";

      return path;

   }


   ::file::path dir_context::commonprograms()
   {

      ::file::path path;

      path = "/usr/share/";

      return path;

   }


   bool dir_context::is_inside_time(const ::file::path & pszPath)
   {

      return is_inside(time(), pszPath);

   }


   bool dir_context::is_inside(const ::file::path & pszDir, const ::file::path & pszPath)
   {

      return ::str::begins_ci(pszDir, pszPath);

   }


   bool dir_context::has_subdir(const ::file::path & path)
   {

      ::file::listing listing;

      ls_dir(listing, path);

      return listing.get_size() > 0;

   }


   ::file::path dir_context::music()
   {

      if(m_pathMusic.has_char())
      {

         return m_pathMusic;

      }

      ::file::path path = xdg_get_dir(this, "XDG_MUSIC_DIR");

      if(path.has_char())
      {

         m_pathMusic = path;

         return path;

      }

      path = getenv("HOME");

      path /= "Music";

      m_pathMusic = path;

      return path;

   }


   ::file::path dir_context::video()
   {

      if(m_pathVideo.has_char())
      {

         return m_pathVideo;

      }

      ::file::path path = xdg_get_dir(this, "XDG_VIDEOS_DIR");

      if(path.has_char())
      {

         m_pathVideo = path;

         return path;

      }

      path = getenv("HOME");

      path /= "Videos";

      m_pathVideo = path;

      return path;

   }


   ::file::path dir_context::image()
   {

      if(m_pathImage.has_char())
      {

         return m_pathImage;

      }

      ::file::path path = xdg_get_dir(this, "XDG_PICTURES_DIR");

      if(path.has_char())
      {

         m_pathImage = path;

         return path;

      }

      path = getenv("HOME");

      path /= "Pictures";

      m_pathImage = path;

      return path;

   }


   ::file::path dir_context::document()
   {

      if(m_pathDocument)
      {

         return m_pathDocument;

      }

      ::file::path path = xdg_get_dir(this, "XDG_DOCUMENTS_DIR");

      if(path.has_char())
      {

         m_pathDocument = path;

         return path;

      }

      path = getenv("HOME");

      path /= "Documents";

      m_pathDocument = path;

      return path;

   }


   ::file::path dir_context::download()
   {

      if(m_pathDownload.has_char())
      {

         return m_pathDownload;

      }

      ::file::path path = xdg_get_dir(this, "XDG_DOWNLOAD_DIR");

      if(path.has_char())
      {

         m_pathDownload = path;

         return path;

      }

      path = getenv("HOME");

      path /= "Downloads";

      m_pathDownload = path;

      return path;

   }


} // namespace linux



