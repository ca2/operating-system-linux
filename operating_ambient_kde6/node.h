//
// Created by camilo on 19/01/2021. <33TBS!!
//

//
// Created by camilo on 19/01/2021. <3-<3ThomasBS!!
//
#pragma once


#include "aura_linux/node.h"
#include "node_kde6/node.h"


namespace operating_ambient_kde6
{


   class CLASS_DECL_OPERATING_AMBIENT_KDE6 node :
      virtual public ::aura_linux::node,
      virtual public ::node_kde6::node
   {
   public:


      node();
      ~node() override;


      //void defer_notify_startup_complete() override;

      //void start_node() override;

      void initialize(::particle * pparticle) override;

      //virtual bool aaa_windowing_message_loop_step();

//      void handle(::topic * ptopic, ::context * pcontext) override;
//
//      bool should_launch_on_node(::topic * ptopic) override;
//
//      bool launch_on_node(::topic * ptopic) override;
//

      void reboot() override;


   };


} // namespace operating_ambient_kde6




