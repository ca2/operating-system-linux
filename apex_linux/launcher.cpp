#include "framework.h"
#include "apex/platform/launcher.h"
#include "launcher.h"


namespace linux
{


   void launcher::start()
   {

      if (!ensure_executable())
      {

         //return false;

         throw_status(error_failed);

      }

      string strPath(get_executable_path());

      string strDir(file_path_name(strPath));


      /*string strPath

      SHELLEXECUTEINFOA infoa;

      __memset(&infoa, 0, sizeof(infoa));

      infoa.cbSize         = sizeof(infoa);
      infoa.pFile         = strPath;

      infoa.pDirectory    = strDir;*/


      //execlp(strPath, strPath, (char *) 0);


      //return true;

   }


} // namespace linux



