#include "framework.h"
//#include "node/platform/node.h"
#include "acme/filesystem/filesystem/acme_directory.h"
#include "acme/filesystem/filesystem/acme_path.h"
//#include "acme_linux/acme.h"
#include "node.h"
////#include "aura/operating_system/linux/_.h"


bool __node_node_pre_init();
bool __node_node_pos_init();


namespace apex_linux
{


   node::node()
   {

      m_pApexPlatform = this;

   }


   node::~node()
   {


   }


   string node::get_user_name()
   {

//      WCHAR wsz[1024];
//
//      DWORD dwSize = sizeof(wsz) / sizeof(WCHAR);
//
//      ::GetUserNameW(wsz, &dwSize);
//
//      return string(wsz);

      return "";

   }


   void node::initialize(::particle * pparticle)
   {

      //auto estatus =

      ::acme_linux::node::initialize(pparticle);

//         if (!estatus)
//         {
//
//            return estatus;
//
//         }

//         if (!__node_node_pre_init())
//         {
//
//            return error_failed;
//
//         }


//         if (!__node_node_pos_init())
//         {
//
//            return error_failed;
//
//         }

      //return estatus;

   }


   void node::_001InitializeShellOpen()
   {

      //ASSERT(m_atomApp == nullptr && m_atomSystemTopic == nullptr); // do once

      //m_atomApp            = ::GlobalAddAtomW(utf8_to_unicode(m_strAppName));

      //m_atomSystemTopic    = ::GlobalAddAtomW(L"system");

      //return ::success;

   }


//      void node::file_open(const ::file::path & path, const ::string& strParams, const ::file::path & pathFolder)
//      {
//
//         ::apex::node::file_open(path, strParams, pathFolder);
//
//      }


   ::e_status node::process_init()
   {

      //defer_initialize_winsock();
      return success;

   }


   int node::node_init_check(int*, char***)
   {

      return ::success;

   }


   void node::on_create_app_shortcut(::acme::application * papplication)
   {

      string strAppName;

      if (papplication->m_strAppName.has_char())
      {

         strAppName = m_strAppName;

      }
      else
      {

         string strAppIdUnderscore = papplication->m_strAppId;

         strAppIdUnderscore.find_replace("/", "_");

         strAppIdUnderscore.find_replace("-", "_");

         strAppName = strAppIdUnderscore;

      }

      string strRoot = papplication->m_strAppId.left(papplication->m_strAppId.find('/'));

      //auto pathCreatedShortcut = acmedirectory()->roaming() / m_strAppId / "created_shortcut.txt";

      ::file::path pathShortcut;

#ifdef WINDOWS_DESKTOP

      pathShortcut = acmedirectory()->roaming() / "Microsoft/Windows/Start Menu/Programs" / strRoot / (strAppName + ".lnk");

#else

      ::string strDesktopFileName;

      strDesktopFileName = m_strAppId;

      strDesktopFileName.find_replace("/", ".");

      pathShortcut = acmedirectory()->home() / ".local/share/applications" / (strDesktopFileName + ".desktop");

#endif

      auto path = acmefile()->module();

      ::file::path pathTarget;
      ::file::path pathIcon;
      int iIcon = -1;

      bool bEnoughCondition1 = !acmefile()->exists(pathShortcut);
      bool bEnoughCondition2 = !acmenode()->m_papexnode->shell_link_target(pathTarget, pathShortcut);
      bool bEnoughCondition3 = !acmepath()->final_is_same(pathTarget, path);
      bool bEnoughCondition4 = !acmenode()->m_papexnode->shell_link_icon(pathIcon, iIcon, path);
      bool bEnoughCondition5 = pathIcon.trimmed().is_empty() || !acmefile()->exists(pathIcon);

      //if (!acmefile()->exists(pathCreatedShortcut)
      if (bEnoughCondition1
         || bEnoughCondition2
         || bEnoughCondition3
         || bEnoughCondition4
         || bEnoughCondition5
         )
      {

         create_app_shortcut();

      }

   }


} // namespace apex_linux



