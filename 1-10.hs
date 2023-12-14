import Data.List

--problem1

myLast list = head (reverse list)  

--problem2

mySecondLast list = let 
                    index = (length list) - 2
                    in list !! index

--problem3

elementAt list index = list !! (index - 1)

--problem4

myLength list = foldl (\acc x -> acc + 1) 0 list

--problem5

myReverse list = foldr (\x acc -> acc ++ [x]) [] list

--problem6

isPalindrome list = if even (length list) then 
                        let listLength = length list 
                            halfLength = listLength `div` 2 
                            firstHalf = take halfLength list 
                            secondHalf = drop halfLength list 
                        in firstHalf == reverse secondHalf

                    else 
                        let listLength = length list 
                            halfLength = listLength `div` 2 
                            firstHalf = take halfLength list 
                            secondHalf = drop (halfLength + 1) list
                        in firstHalf == reverse secondHalf

--problem7

data NestedList a = Elem a | List [NestedList a] 

flatten :: NestedList a -> [a]
flatten (Elem x) = [x] 
flatten (List x) = concatMap flatten x  

--problem8

compress list = let groupedList = group list 
                in
                    map head groupedList 

--problem9 

pack list = group list

--problem10 

encode list = zip (map length (pack list)) (compress list)
