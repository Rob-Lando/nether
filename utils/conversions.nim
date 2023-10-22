import std/strutils
import std/re
import std/math



proc convert(amount: auto, base:string, target:string): float = 

    assert target in ["Eth","Gwei","Wei"]
    assert base in ["Eth","Gwei","Wei"]

    if target == "Eth":

        var Eth: float

        if base == "Wei":
            Eth = float(amount) / float(10^18)

        if base == "Gwei":
            Eth = float(amount) / float(10^9)

        return Eth


    if target == "Wei":

        var Wei: float

        if base == "Gwei":
            Wei = float(amount) * float(10^9)

        if base == "Eth":
            Wei = float(amount) * float(10^18)

        return Wei


    if target == "GWei":

        var Gwei: float

        if base == "Wei":
            GWei = float(amount) / float(10^9)

        if base == "Eth":
            GWei = float(amount) * float(10^9)

        return Gwei



#[
let balance: auto = 3309879687

echo balance.convert(base = "Wei",target = "Eth")
echo balance.convert(base = "Gwei",target = "Eth")
echo balance.convert(base = "Gwei",target = "Wei")
echo balance.convert(base = "Eth",target = "Wei")
]#
