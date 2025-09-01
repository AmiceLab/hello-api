<!--Download aspJSON.asp and include it in the project-->

<!--#include file="aspJSON.asp"-->

<!--Call your Node.js API and parse the JSON-->

<%
Dim http, url, responseText, JSON, message

' URL of Node.js API
url = "http://localhost:3000/api/hello"

' Create XMLHTTP object
Set http = Server.CreateObject("MSXML2.XMLHTTP")
http.Open "GET", url, False
http.Send

' Get response
responseText = http.responseText

' Parse JSON
Set JSON = New aspJSON
JSON.loadJSON(responseText)

' Get the "message" property
message = JSON.data("message")

' Output it
Response.Write "Message from API: " & message

' Clean up
Set http = Nothing
Set JSON = Nothing
%>

