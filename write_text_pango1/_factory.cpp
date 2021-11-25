#include "framework.h"


__FACTORY_EXPORT void write_text_pango_factory(::factory::factory * pfactory)
{

   pfactory->add_factory_item < ::write_text_pango::font_department, ::font_department >();
   pfactory->add_factory_item < ::write_text_pango::write_text, ::write_text::write_text >();

}
