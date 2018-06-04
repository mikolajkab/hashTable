function calclHash(value, numBuckets)
return mod(value,numBuckets)
end

function createHashArray(inputArray, maxSize)
if ndims(inputArray) != 1
    return false
end

inputArraySize = size(inputArray,1)
if inputArray == 0
    return false
end

hashArray = Array{Int}[]
if inputArraySize <= maxSize
    for i in 1:inputArraySize
        push!(hashArray,[])
     end
    return hashArray
elseif inputArraySize > maxSize
    for i in 1:maxSize
        push!(hashArray,[])
     end
    return hashArray
    end
end

function placeInBucket!(hashArray, value_hash)
if nfields(value_hash) != 2
    return false
end

if size(hashArray,1) < value_hash[2]
    return false
end

value = value_hash[1]
hash = value_hash[2]
push!(hashArray[hash], value)
return true
end