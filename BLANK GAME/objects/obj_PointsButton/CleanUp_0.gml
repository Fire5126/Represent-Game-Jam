buffer_seek(tokens, buffer_seek_start, 0);
buffer_write(tokens, buffer_u8,global.TOKENS);
buffer_save(tokens,"tokens.data");