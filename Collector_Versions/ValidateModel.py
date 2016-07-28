'''
Created on Jun 22, 2016

@author: kyleg
'''

if __name__ == '__main__':
    pass

def ValidatetoFileGDB():
    from arcpy import ImportXMLWorkspaceDocument_management, Exists, CreateFileGDB_management, Delete_management


    xmlIn = r"C:\temp\c2016072704_test.xml"
    GDB_In = r"C:\temp\testgdb"
    gdbin = GDB_In+".gdb"
    if Exists(gdbin):
        Delete_management(gdbin, "Workspace")
        CreateFileGDB_management(r"C:/temp", "testgdb", "CURRENT")
    ImportXMLWorkspaceDocument_management(gdbin, xmlIn, import_type="SCHEMA_ONLY")
ValidatetoFileGDB()