#pragma once


#include "audio-user/audio_mixer/_.h"


#if defined(_audio_mixer_alsa_project)
   #define CLASS_DECL_AUDIO_MIXER_ALSA  CLASS_DECL_EXPORT
#else
   #define CLASS_DECL_AUDIO_MIXER_ALSA  CLASS_DECL_IMPORT
#endif


namespace multimedia
{


   namespace audio_mixer_alsa
   {


      class callback;
      class device;
      class source;
      class destination;
      class thread;
      class audio_mixer;
      class departament;


      class window;


   } // namespace audio_mixer_alsa


} // namespace multimedia










