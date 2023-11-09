require 'byebug'

# phase 1

# def my_list(list) # O(n)
#     min = 0

#     list.each do |elem|
#         min = elem if elem < min
#     end
# end



# phase 2

# def my_min(list) # O(n)
#     # list.min
#     list.inject { |accumulator, elem| accumulator <= elem ? accumulator : elem}
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# puts my_min(list) 


# def sub_sum(list)
#     max_value = list.min
#     (0...list.length).each do |ind1|
#         (ind1...list.length).each do |ind2|
#             subarr = list[ind1..ind2].sum
#             max_value = subarr if max_value < subarr
#         end
#     end
#     max_value
# end

# list = [-5, -1, -3]

# puts sub_sum(list)


# Largest contiguous sub-sum

# phase 1
# def sub_sum(list)
#     max_value = []
#     (0...list.length).each do |ind1| # n
#         (ind1...list.length).each do |ind2| # n
#             # swap to reg indexing to become constant
#             subarr = list[ind1..ind2].sum # n + n = 2n
#             max_value << subarr
#         end
#     end

#     max_value.max
# end

# list = [2, 3, -6, 7, -6, 7]

# puts sub_sum(list)

def sub_sum(list)
    cur_elem = list.first # 2 + 3 + (-6) = -1 ==> 0 + 7 + (-6) = 1 + 7 = 8
    max_sum = list.first # 7
    # -5 ==> 0 + -1 ==> -1 
    # -5
    i = 0
    while i < list.length - 1 # take close note to the order of steps below
        
        cur_elem = 0 if cur_elem < 0 # noice
        # cur_elem += list[i + 1]
        # max_sum = cur_elem if max_sum < cur_elem 
        sum = cur_elem + list[i + 1] 
        max_sum = sum if max_sum < sum
        cur_elem = sum

        # sum = cur_elem + list[i + 1] # add prev sum and curr sum
        # cur_elem = sum 
        # if sum < 0 && sum < max_sum # reset
        #     cur_elem = 0
        # elsif sum > max_sum
        #     max_sum = sum
        # end

        i += 1
    end

    max_sum
end 

list = [-5, -1, -3]
list = [2, 3, -6, 7, -6, 7]
# [-5] -5 
# [-5, -1] -6 ==> reset 0
# [-5, -1, -3] ==> [0, -3] ==> 0
# [-1] 
# [-1, -3] 
# [-3] 
puts sub_sum(list)