class Functions
    $debug_on = false
    def weapon_confimation(weapon_p1, weapon_p2)
        if $debug_on
            puts "test1"
        end
        if(is_weapon_sign(weapon_p1))
            if $debug_on
                puts "test2"
            end
            if weapon_p1.nil?
                if $debug_on    
                    puts "test3"
                end
                true
            else
                if $debug_on
                    puts "test3.2"
                end
                if (weapon_p1.eql? weapon_p2)
                    if $debug_on
                        puts "test4.1"
                    end
                    false
                else
                    if $debug_on
                        puts "test4.2"
                        puts weapon_p1
                    end
                    true
                end
            end
            
        else
            if $debug_on
                puts "test1.2"
            end
            false
        end
    end

    def is_weapon_sign(weapon_p1)
        if (((weapon_p1.upcase).strip).eql? "X")
            if $debug_on
                puts "sign1.1"
            end
            true
        elsif ((weapon_p1.upcase).strip).eql? "O"
            if $debug_on
                puts "sign1.1"
            end
            true
        else
            if $debug_on
                puts "sign1.2"
            end
            false
        end
    end

    def in_array(cache, arr)
        result = false
        for a in 0..arr.length-1
            if arr[a].eql? cache
                result = true
            else
                false
            end
        end
        result
    end

    def num_to_choice(ind)
        [(ind-1)/3,(ind-1) % 3];
    end

    def choice_to_num(arr)
        arr[0]*3 + arr[1] + 1;
    end

    def is_num_on_choices(num, mat)
        result = false
        coords = num_to_choice(num);
        for c in 0..mat.length-1
            if mat[c][0]==coords[0]&&mat[c][1]==coords[1]
                result = true
            else
                false
            end
        end
        result
    end

    def check_similarity(num, mat, type, length)
        result = false
        #for c in 0..length-1
            if type.eql? "h"
                if num % length==0
                    if (is_num_on_choices(num-1, mat) && is_num_on_choices(num-2, mat) )
                        result = true
                    end
                elsif num % length==2
                    if (is_num_on_choices(num+1, mat) && is_num_on_choices(num-1, mat) )
                        result = true
                    end
                elsif num % length==1
                    if (is_num_on_choices(num+1, mat) && is_num_on_choices(num+2, mat) )
                        result = true
                    end
                end
            elsif type.eql? "v"
                rowcheck = num/length
                if $debug_on
                    puts "num"
                    puts 2/3
                    puts num/length
                end
                if (num/length<1||( num/length==1 && num % length==0) )
                    if $debug_on
                        puts "test1"
                    end
                    if (is_num_on_choices(num+3, mat) && is_num_on_choices(num+6, mat) )
                        result = true
                    end
                elsif (num/length<2||( num/length==2 && num % length==0) )
                    if $debug_on
                        puts "test2"
                    end
                    if (is_num_on_choices(num+3, mat) && is_num_on_choices(num-3, mat) )
                        result = true
                    end
                elsif (num/length<3||( num/length==3 && num % length==0) )
                    if $debug_on
                        puts "test3"
                    end
                    if (is_num_on_choices(num-3, mat) && is_num_on_choices(num-6, mat) )
                        result = true
                    end
                end
                if $debug_on
                    puts rowcheck
                    puts 3/2
                end
            elsif type.eql? "d"
                if num==1
                    if (is_num_on_choices(num+4, mat) && is_num_on_choices(num+8, mat) )
                        result = true
                    end
                elsif num==3
                    if (is_num_on_choices(num+2, mat) && is_num_on_choices(num-2, mat) )
                        result = true
                    end
                elsif num==5
                    if ( (is_num_on_choices(num+4, mat) && is_num_on_choices(num-4, mat) ) || (is_num_on_choices(num+2, mat) && is_num_on_choices(num-2, mat) ) )
                        result = true
                    end
                elsif num==7
                    if (is_num_on_choices(num-2, mat) && is_num_on_choices(num-4, mat) )
                        result = true
                    end
                elsif num==9
                    if (is_num_on_choices(num-4, mat) && is_num_on_choices(num-8, mat) )
                        result = true
                    end
                end
            end
        #end
        result
    end

    def win_confirmation(num, mat)
        result = false
        choice = mat.length
        for c in 0..choice-1
            if check_similarity(num, mat, "h", 3)==true
                result = true
                break
            elsif check_similarity(num, mat, "v", 3)==true
                result = true
                break
            elsif check_similarity(num, mat, "d", 3)==true
                result = true
                break
            end
        end
        result
    end
end