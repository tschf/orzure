create or replace package body azure_blob
as


    NEW_LINE constant varchar2(1) := chr(12);

    function get_md5_sum(
        file in out nocopy blob
    )
    return varchar2
    as
        file_md5_sum varchar2(32 char);
    begin

        file_md5_sum :=
            dbms_crypto.hash(
                src => file
              , typ => dbms_crypto.hash_md5
            );

        file_md5_sum := lower(file_md5_sum);

        return file_md5_sum;

    end get_md5_sum;

    function get_file_length(
        file in out nocopy blob
    )
    return integer
    as
        file_length integer;
    begin

        file_length := dbms_lob.getlength(file);

        return file_length;

    end get_file_length;

end azure_blob;
/
