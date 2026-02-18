table 80159 "Blob Demo"
{
    fields
    {
        field(1; PKEY; Integer)
        {

        }
        field(2; BLOB; Blob)
        {
            Subtype = Bitmap;
        }
    }
    keys
    {
        key(PK; PKEY)
        { }
    }
}