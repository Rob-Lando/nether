import std/json
import httpclient
import std/strformat
import std/strutils
import std/re
import std/tables
from provider import Provider




proc eth_getBalance*(
            provider: Provider,
            address: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        assert contains(address,re("0x"))

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [address,default_block]
        else:
            assert contains(block_number,re("0x"))
            params = [address,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getBalance",
            "params": params,
            "id":id
        }


        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson



proc eth_getStorageAt*(
            provider: Provider,
            address: string,
            storage_position: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode = 

        assert contains(address,re("0x"))

        var 
            client = newHttpClient()
            params: array[3,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [address,storage_position,default_block]
        else:
            assert contains(block_number,re("0x"))
            params = [address,storage_position,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getStorageAt",
            "params": params,
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson



proc eth_getTransactionCount*(
            provider: provider.Provider,
            address: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        assert contains(address,re("0x"))

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [address,default_block]
        else:
            assert contains(block_number,re("0x"))
            params = [address,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getTransactionCount",
            "params": params,
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson

proc eth_getCode*(
            provider: provider.Provider,
            address: string,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        assert contains(address,re("0x"))

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [address,default_block]
        else:
            assert contains(block_number,re("0x"))
            params = [address,block_number]

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_getCode",
            "params": params,
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson




proc eth_call*(
            provider: provider.Provider,
            transaction_params: Table,
            block_number_or_default_block: string = "latest",
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"}),
            id: int = 1
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string 
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        let data = %*{
            "jsonrpc":"2.0",
            "method":"eth_call",
            "params": [transaction_params,block_number_or_default_block],
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson

proc eth_estimateGas*(
            provider: provider.Provider,
            transaction_params: Table,
            block_number_or_default_block: string = "latest",
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"}),
            id: int = 1    
        ): JsonNode = 

        var 
            client = newHttpClient()
            params: array[2,string]
            url: string 
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        let data = %*{
            "jsonrpc":"2.0", 
            "method":"eth_estimateGas",
            "params": [transaction_params,block_number_or_default_block],
            "id":id
        }

        let 
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson
    