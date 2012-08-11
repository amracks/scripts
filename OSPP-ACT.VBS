Set objWMI = GetObject("winmgmts:" _
        & "{impersonationLevel=impersonate}!\\" & "." & "\root\cimv2")

ExecuteQuery "ID, ApplicationId, PartialProductKey, Description, Name","PartialProductKey <> null","OfficeSoftwareProtectionProduct"

Function ExecuteQuery(strSelect,strWhere,strClass)
    
Err.Clear
    
If strWhere = "" Then
    Set productinstances = objWMI.ExecQuery("SELECT " & strSelect & " FROM " & strClass)
Else
    Set productinstances = objWMI.ExecQuery("SELECT " & strSelect & " FROM " & strClass & " WHERE " & strWhere)
End If
    
sppErrHandle ""

End Function


Set count = productinstances.Count

For index = 0 to count
    set instance = productinstances.Item(index)
    If (LCase(instance.ApplicationId) = OfficeAppId) Then
        If instance.PartialProductKey <> "" Then
            i = i + 1
        End If
        instance.Activate
        SppErrHandle(strCommand)
    End If
Next
