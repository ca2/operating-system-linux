//
// Created by camilo on 21/01/2021. <33TBS!!
//

//
// Created by camilo on 21/01/2021. <3-<3ThomasBS!!
//
#pragma once


#include "acme_linux/node.h"
#include "apex_posix/node.h"


namespace apex_linux
{


   class CLASS_DECL_APEX_LINUX node :
      virtual public ::acme_linux::node,
      virtual public ::apex_posix::node
   {
   public:


      node();

      ~node() override;


      void initialize(::particle * pparticle) override;


      string get_user_name() override;

      virtual ::e_status process_init();

      void _001InitializeShellOpen() override;

      //void shell_open(const ::file::path & path, const ::string& strParams, const ::file::path & pathFolder) override;

      void on_create_app_shortcut(::acme::application * papplication) override;


      ::file::path app_shortcut_path(::acme::application* papplication) override;


   };


} // namespace apex_linux



