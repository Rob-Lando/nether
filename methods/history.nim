import std/json
import httpclient
import std/strformat
import std/strutils
import std/re
from provider import Provider


proc eth_getBlockTransactionCountByHash*(
            provider: Provider,
            block_hash: string = "",
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        params = [block_hash]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getBlockTransactionCountByHash",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson




proc eth_getBlockTransactionCountByNumber*(
            provider: Provider,
            block_number: string = "",
            default_block: string = "",
            id: int = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
        
        client.headers = headers

        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [default_block]
        else:
            assert contains(block_number,re("0x"))
            params = [block_number]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getBlockTransactionCountByNumber",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)

        return responseJson




proc eth_getUncleCountByBlockHash*(
            provider: Provider,
            block_hash: string = "",
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        params = [block_hash]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getUncleCountByBlockHash",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson




proc eth_getBlockByHash*(
            provider: Provider,
            block_hash: string = "",
            return_full: bool = False,
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        params = [block_hash,return_full]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getBlockByHash",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson




proc eth_getBlockByNumber*(
            provider: Provider,
            block_number: string = "",
            default_block: string = "",
            return_full: bool = False,
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        if default_block != "":
            assert default_block in ["earliest","latest","pending"]
            params = [default_block,return_full]
        else:
            assert contains(block_number,re("0x"))
            params = [block_number,return_full]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getBlockByNumber",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson




proc eth_getTransactionByHash*(
            provider: Provider,
            tx_hash: string = "",
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        params = [tx_hash]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getTransactionByHash",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson




proc eth_getTransactionByBlockHashAndIndex*(
            provider: Provider,
            tx_hash: string = "",
            index: string = "0x0"
            id = 1,
            headers: HttpHeaders = newHttpHeaders({"Content-Type":"application/json"})
        ): JsonNode =

        var 
            client = newHttpClient()
            params: array[1,string]
            url: string
            
        if provider.url != "":
            url = provider.url
        else:
            url = fmt"{provider.base_url}/{provider.api_key}"

        params = [tx_hash,index]

        let 
            data: JsonNode = %*{
                "jsonrpc":"2.0",
                "method":"eth_getTransactionByBlockHashAndIndex",
                "params": params,
                "id":id
            }
            response = postContent(client = client, url = url, body = $data)
            responseJson = parseJson(response)
        
        return responseJson
