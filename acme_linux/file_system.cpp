#include "framework.h"
#include "file_system.h"
#include "acme/filesystem/filesystem/path_system.h"
#include "acme/filesystem/filesystem/directory_system.h"


namespace acme_linux
{


   file_system::file_system()
   {

   }


   file_system::~file_system()
   {

   }


   void file_system::initialize(::particle * pparticle)
   {

      //auto estatus =

         ::file_system::initialize(pparticle);

//      if(!estatus)
//      {
//
//         return estatus;
//
//      }
//
//      return estatus;

   }


   void file_system::init_system()
   {

//      if(!update_module_path())
//      {
//
//         return ::error_failed;
//
//      }

//      return ::success;

   }


//   ::e_status file_system::update_module_path()
//   {
//
//      auto estatus = ::file_system::update_module_path();
//
//      if(!estatus)
//      {
//
//         return estatus;
//
//      }
//
//      ::file::path pathAppModule = file_system()->module();
//
//      m_pathModule = pathAppModule;
//
//      auto psystem = system();
//
//      auto pacmefile = psystem->m_pacmefile;
//
//      ::file::path pathCa2AppModule = pacmefile->module();
//
//      m_pathCa2Module = pathCa2AppModule;
//
//      return estatus;
//
//   }


} // namespace acme_linux



