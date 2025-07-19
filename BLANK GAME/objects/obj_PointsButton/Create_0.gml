if !file_exists("tokens.data"){
	tokens = buffer_create(16,buffer_grow,1);
	buffer_save(tokens,"tokens.data");
	
}
else{
	tokens = buffer_load("tokens.data");
	buffer_seek(tokens, buffer_seek_start, 0);
	global.TOKENS = buffer_read(tokens,buffer_u8);
}