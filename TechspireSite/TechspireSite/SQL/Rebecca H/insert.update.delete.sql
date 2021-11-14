INSERT into CustomerCategory ( category_name, category_desc ) VALUES ('temp suspended', 'suspended temporarily');
INSERT into CustomerCategory ( category_name, category_desc ) VALUES ('softban', 'someone who abuses the program');

UPDATE CustomerCategory set category_name='Soft Ban' where category_name='softban';
UPDATE CustomerCategory set category_name='Looker' where category_name='Lookers';
UPDATE CustomerCategory set category_name='Researcher' where category_name='Researchers';

Delete from CustomerCategory where category_name='temp suspended';
Delete from CustomerCategory where category_name='Soft Ban';