module Concerns

    module Findable
        def find_by_name(name)
            #find a song instance in @@all (self.all) by name
            self.all.detect{|x| x.name == name}
         end

         def find_or_create_by_name(name)
            if self.find_by_name(name) == nil
                self.create(name)
            else
                self.find_by_name(name)
            end
        end
    end

end