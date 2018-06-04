function calclHash(value, numBuckets)
    return mod(value,numBuckets)
end

function createEmptyHashArray(inputArray, maxSize)
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
    push!(hashArray[hash+1], value)
    return true
end

function createHashArray(inputArray, maxSize)
hashArray = createEmptyHashArray(inputArray, maxSize)

numBuckets = size(hashArray, 1)
    for value in inputArray
        hash = calclHash(value, numBuckets)
        value_hash = (value, hash)
        placeInBucket!(hashArray, value_hash)
    end

    return hashArray
end

function returnVector(hashArray, index)
    if index > size(hashArray,1)
        return false
    end
    return hashArray[index]
end

function isInVector(vector, value)
    for i in vector
        if i==value
            return true
        end
    end
    return false
end

function isInHashTable(hashTable, value)
    numBuckets = size(hashTable, 1)
    hash = calclHash(value, numBuckets)
    return isInVector(hashTable[hash+1], value)
end