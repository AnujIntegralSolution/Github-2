codeunit 80154 ImportPictures
{

    procedure ImportPicturesFromZip()
    begin
        if not UploadIntoStream(SelectZIPFileMsg, '', 'Zip Files|*.zip', ZipFileName, InStream) then
            Error('');
        DataCompression.OpenZipArchive(InStream, false);
        DataCompression.GetEntryList(EntryList);
        FileCount := 0;
        foreach EntryListKey in EntryList do begin
            FileName := CopyStr(FileMgt.GetFileNameWithoutExtension(EntryListKey), 1, MaxStrLen(FileName));
            FileExtension := CopyStr(FileMgt.GetExtension(EntryListKey), 1, MaxStrLen(FileExtension));
            TempBlob.CreateOutStream(EntryOutStream);
            DataCompression.ExtractEntry(EntryListKey, EntryOutStream, Length);
            TempBlob.CreateInStream(EntryInStream);
            if not Cust.Get(FileName) then
                Error(NoCustError, FileName);
            Clear(Cust."Customer Picture");
            Cust."Customer Picture".ImportStream(EntryInStream, FileName);
            Cust.Modify(true);
            FileCount += 1;
        end;
        DataCompression.CloseZipArchive();

        if FileCount > 0 then
            Message(ImportedMsg, FileCount);
    end;


    var
        FileMgt: Codeunit "File Management";
        DataCompression: Codeunit "Data Compression";
        TempBlob: Codeunit "Temp Blob";
        EntryList: List of [Text];
        EntryListKey: Text;
        ZipFileName: Text;
        FileName: Text;
        FileExtension: Text;
        InStream: InStream;
        EntryOutStream: OutStream;
        EntryInStream: InStream;
        Length: Integer;
        SelectZIPFileMsg: Label 'Select ZIP File';
        FileCount: Integer;
        Cust: Record "Clients Header";
        NoCustError: Label 'Customer %1 does not exist.';
        ImportedMsg: Label '%1 pictures imported successfully.';

}
