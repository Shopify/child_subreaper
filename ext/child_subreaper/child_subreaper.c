#include <sys/prctl.h>
#include "ruby.h"

static void set_child_subreaper(int value) {
    if (prctl(PR_SET_CHILD_SUBREAPER, value) < 0) {
        rb_sys_fail("prctl(2) PR_SET_CHILD_SUBREAPER");
    }
}

static VALUE enable_child_subreaper(VALUE module) {
    set_child_subreaper(1);
    return Qtrue;
}

static VALUE disable_child_subreaper(VALUE module) {
    set_child_subreaper(0);
    return Qtrue;
}

void Init_child_subreaper(void)
{
  VALUE rb_mChildSubreaper = rb_define_module("ChildSubreaper");
  rb_define_singleton_method(rb_mChildSubreaper, "enable", enable_child_subreaper, 0);
  rb_define_singleton_method(rb_mChildSubreaper, "disable", disable_child_subreaper, 0);
}
