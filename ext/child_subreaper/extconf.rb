# frozen_string_literal: true

require "mkmf"

if Process.respond_to?(:fork) && have_const("PR_SET_CHILD_SUBREAPER", "sys/prctl.h")
  create_makefile("child_subreaper/child_subreaper")
else
  File.write("Makefile", dummy_makefile($srcdir).join)
end
