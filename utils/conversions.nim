import std/strutils
import std/re
import std/math



proc convert(amount: float|int, base:string, target:string): float = 

    let float_amount: float = float(amount)

    if target == "Eth":

        var eth: float

        if base == "Wei":
            eth = float(amount) / float(10^18)
            return eth
        if base == "Gwei":
            eth = float(amount) / float(10^9)
            return eth


    elif target == "Wei":

        var Wei: float

        if base == "Gwei":
            Wei = float(amount) * float(10^9)
            return Wei
        if base == "Eth":
            Wei = float(amount) * float(10^18)
            return Wei


let balance: auto = 330.0

echo balance.convert(base = "Wei",target = "Eth")
echo balance.convert(base = "Gwei",target = "Eth")
echo balance.convert(base = "Gwei",target = "Wei")
echo balance.convert(base = "Eth",target = "Wei")