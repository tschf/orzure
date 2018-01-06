create or replace package azure_blob
as

    function get_md5_sum(
        file in out nocopy blob
    )
    return varchar2;

    function get_file_length(
        file in out nocopy blob
    )
    return integer;


end azure_blob;
/
