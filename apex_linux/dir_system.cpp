#include "framework.h"


#undef USE_MISC


#include <dlfcn.h>
#include <link.h>


namespace linux
{


   dir_system::dir_system()
   {

   }


   dir_system::~dir_system()
   {

   }


   ::e_status dir_system::initialize(::object * pobject)
   {

      auto estatus = ::dir_system::initialize(pobject);

      if(!estatus)
      {

         return estatus;

      }

      m_pathHome = getenv("HOME");

      m_pathCa2Config = m_pathHome / ".config/ca2";

      return estatus;

    }


} // namespace linux



