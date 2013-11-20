module NoMossTests
  module Agriculture
    module Roles
      Cattle = NoMoss.define_role do
        implements :moo, :low
        implements :grunt
      end
    end

    module Animals
      class Yak
        def moo   ; "Mooooooooo" ; end
        def low   ; "Mooooooooo" ; end
        def grunt ; "hmph"       ; end
      end

      class Cat
        def meow ; "Meow"      ; end
        def purr ; "Purrrrr"   ; end
        def claw ; "*scratch*" ; end
        def destroy_furniture
          meow; purr; claw
        end
      end
    end
  end
end
