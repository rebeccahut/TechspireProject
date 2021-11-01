INSERT into CustomerCategory ( category_name, category_desc ) VALUES ('temp suspended', 'suspended temporarily')
INSERT into CustomerCategory ( category_name, category_desc ) VALUES ('softban', 'someone who abuses the program')

UPDATE CustomerCategory set category_name='soft ban' where category_name='softban';

Delete from CustomerCategory where category_name='temp suspended';