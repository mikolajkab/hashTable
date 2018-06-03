function calclHash(value, numBuckets)
return mod(value,numBuckets)
end

function createHashArray(array, maxSize)
if ndims(array) != 1
    return false
end

arraySize = size(array,1)
if arraySize == 0
    return false
elseif arraySize <= maxSize
    A = Array{Int64,1}(arraySize)
    fill!(A, 0)
    return A
elseif arraySize > maxSize
    A = Array{Int64,1}(maxSize)
    fill!(A, 0)
    return A
end
    return false
end