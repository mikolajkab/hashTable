
include("C:\\Home\\OKNO\\TIWO\\hash\\hashSrc.jl")
include("C:\\Home\\OKNO\\TIWO\\hash\\hashTest.jl")

@printf("\nWelcome to Hashing application \n")
@printf("Type 1 to run demo example of the applicaation.
Type 2 to hash and de-hash your table.
Type 3 to run unit tests written by TDD method.
Type 4 to exit.\n")

n = parse(Int, readline())
while n != 1 && n != 2 && n != 3 && n != 4
    @printf("Invalid input. Try again.\n")
    n = parse(Int, readline())
end

if n == 1
    @printf("Case 1: Demo example.\n")
    @printf("InputArray = [1, 2, 3, 4, 5, 6, 7, 8] hashed into 2 buckets:\n")
    inputArray = [1, 2, 3, 4, 5, 6, 7, 8]
    hashTable = createHashArray(inputArray, 2)
    println(hashTable)

    @printf("Bucket number and index in bucket of value 7:\n")
    println(getValueFromHashTable(hashTable, 7))

    @printf("InputArray = [1, 2, 3, 4, 5, 6, 7, 8] hashed into 4 buckets:\n")
    inputArray = [1, 2, 3, 4, 5, 6, 7, 8]
    hashTable = createHashArray(inputArray, 4)
    println(hashTable)

    @printf("Bucket number and index in bucket of value 7:\n")
    println(getValueFromHashTable(hashTable, 7))

elseif n == 2
    @printf("Case 2: Hash and de-hash your table.\n")
    @printf("Give numbers for input array. End with 2x enter.\n")

    inputArray = Int64[]
    input = readline()

    while input != ""
        n = parse(Int, input)
        push!(inputArray,n)
        input = readline()
    end

    @printf("Your input array is:\n")
    println(inputArray)

    @printf("Give max number of buckets:\n")
    input = readline()
    numBuckets = parse(Int, input)

    @printf("Your hashed array:\n")
    hashTable = createHashArray(inputArray, numBuckets)
    println(hashTable)

    @printf("Give number you want to de-hash:\n")
    input = readline()
    n = parse(Int, input)

    retVal = getValueFromHashTable(hashTable, n)
    if retVal != false
        @printf("Bucket number and index of your number:\n")
        println(retVal)
    else
        @printf("Given number was not found.\n")
    end

elseif n == 3
    @printf("Case 3: Run unit tests.\n")
    runUnitTests()
elseif n == 4
    @printf("Case 4: Application closed.")
end