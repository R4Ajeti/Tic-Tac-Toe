def weapon_confimation(weapon_p1, weapon_p2)
    puts "test1"
    if(is_weapon_sign(weapon_p1))
        puts "test2"
        if weapon_p1.nil?
            puts "test3"
            true
        else
            puts "test3.2"
            if (weapon_p1.eql? weapon_p2)
                puts "test4.1"
                false
            else
                puts "test4.2"
                puts weapon_p1
                true
            end
        end
        
    else
        puts "test1.2"
        false
    end
end

def is_weapon_sign(weapon_p1)
    if (((weapon_p1.upcase).strip).eql? "X")
        puts "sign1.1"
        true
    elsif ((weapon_p1.upcase).strip).eql? "O"
        puts "sign1.1"
        true
    else
        puts "sign1.2"
        false
    end
end