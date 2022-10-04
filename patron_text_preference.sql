WBVardef today=@"select to_char(current_date,'mmddyyyy')";

WBExport -type=text
         -file='c:/Shoutbomb/FTP/Text/text$[today].txt'
         -delimiter='|'
         -quotechar='"'
         -quoteCharEscaping=escape
         -lineEnding=crlf
         -encoding=utf8;           

SELECT phone_number, barcode 
	FROM sierra_view.patron_view v
	JOIN sierra_view.patron_record_phone r ON v.id = r.patron_record_id
	JOIN sierra_view.patron_record_phone_type ty ON r.patron_record_phone_type_id = ty.id
	WHERE notification_medium_code = 't' AND code = 'p' AND expiration_date_gmt > current_date