#pragma once

/*
Module : IPENUM.H
Purpose: Interface for an apex API class wrapper for IP address enumeration
Created: PJN / 21-04-1998
History: None

Copyright (ca) 1998 by PJ Naughter.


*/
#pragma once



#include "apex/networking/ip_enum.h"


namespace apex_linux
{


   class CLASS_DECL_APEX_LINUX ip_enum :
      virtual public ::networking::ip_enum
   {
   public:


      bool     m_bWinsockInitialized;


      ip_enum();
      virtual ~ip_enum();


      //      virtual ::count enumerate(ip_array & ipa);
      virtual ::count enumerate(__pointer_array(::networking::address) & ipa) override;

   };


} // namespace apex_linux



