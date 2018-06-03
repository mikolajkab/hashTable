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

push!(hashArray[value_hash[2]], value_hash[1])
return hashArray[value_hash[2]][size(hashArray[value_hash[2]]),1]
end