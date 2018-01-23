insert into User (username, password, email, enabled) values ('michal','311FC486C10A0CA2D9D62DEBB2B81DA04BF423B9E1285FBDD26054E8B4590DFE','michal@wp.pl',0);
insert into User (username, password, email, enabled) values ('janek','311FC486C10A0CA2D9D62DEBB2B81DA04BF423B9E1285FBDD26054E8B4590DFE','michal2@wp.pl',0);
insert into User (username, password, email, enabled) values ('komosa','311FC486C10A0CA2D9D62DEBB2B81DA04BF423B9E1285FBDD26054E8B4590DFE','michal3@wp.pl',0);
insert into User (username, password, email, enabled) values ('ryżowa','311FC486C10A0CA2D9D62DEBB2B81DA04BF423B9E1285FBDD26054E8B4590DFE','michal4@wp.pl',0);
insert into User (username, password, email, enabled) values ('jolo','311FC486C10A0CA2D9D62DEBB2B81DA04BF423B9E1285FBDD26054E8B4590DFE','michal5@wp.pl',0);

insert into Tweet (text,user_id,created) values ("kaszando",1,NOW());
insert into Tweet (text,user_id,created) values ("kaszando1",2,NOW());
insert into Tweet (text,user_id,created) values ("kaszando2",3,NOW());
insert into Tweet (text,user_id,created) values ("kaszando3",4,NOW());
insert into Tweet (text,user_id,created) values ("kaszando4",5,NOW());
insert into Tweet (text,user_id,created) values ("kaszando",1,NOW());
insert into Tweet (text,user_id,created) values ("kaszandasdfo",1,NOW());
insert into Tweet (text,user_id,created) values ("kaszando132",3,NOW());
insert into Tweet (text,user_id,created) values ("kaszando123",5,NOW());
insert into Tweet (text,user_id,created) values ("kaszandsdfgo",2,NOW());
insert into Tweet (text,user_id,created) values ("kaszandsdfgo",1,NOW());

insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasafghasdsdfdasd',1,2,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasadfghasdsdfdasd',1,3,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasadfghasdsdfdasd',1,4,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasafghdfghasdsdfdasd',1,5,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasdfghaasdsdfdasd',1,2,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasfgaasdsdfdasd',1,3,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (true,'sdasadfghasdsdfdasd',1,4,NOW(),1,1)

insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdretasaasdsdfdasd',1,2,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdaersaasdsdfdasd',1,3,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdasaasdsdfdasd',1,3,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdasergaasdsdfdasd',1,4,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdreasaasdsdfdasd',1,2,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdasaassdfgdsdfdasd',1,5,NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdertasaasdsdfdasd',1,4,NOW(),1,1)

insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdfgsdfgsdasaasssssssssssdfasdfwerwerwerwersasdfasfgsdfgssssssssssssssssssssssssssssssssssssssssssssdsasdasdsadasdsdsdfdasd',2,1, NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdfgsdfgsdasaasssssssssssdfasdfwerwerwerwersasdfasfgsdfgssssssssssssssssssssssssssssssssssssssssssssdsasdasdsadasdsdsdfdasd',2,1, NOW(),1,1)
insert into Message (readOrNot, text, user_id,sender_id,created,isVisibleToSender,isVisibleToUser) values (false,'sdfgsdfgsdasaasssssssssssdfasdfwerwerwerwersasdfasfgsdfgssssssssssssssssssssssssssssssssssssssssssssdsasdasdsadasdsdsdfdasd',2,1, NOW(),1,1)

insert into Comments (created, text, post_id,user_id) value (NOW(), "dfto jest komentarz", 1,1);
insert into Comments (created, text, post_id,user_id) value (NOW(), "dfgto asdfjest komentarz", 1,2);
insert into Comments (created, text, post_id,user_id) value (NOW(), "toasdf jest komentarz", 2,3);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tdfgo jdfgest komentarz", 7,4);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tsdfgo jest komentarz", 6,5);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tgdfodf vsdfjest komentarz", 1,2);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tdfgo jest komentarz", 3,2);
insert into Comments (created, text, post_id,user_id) value (NOW(), "togsd jest komentarz", 8,3);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tofdg jest komentarz", 9,4);
insert into Comments (created, text, post_id,user_id) value (NOW(), "to1232123 jest komentarz", 3,5);
insert into Comments (created, text, post_id,user_id) value (NOW(), "todsfg jest komentarz", 4,1);
insert into Comments (created, text, post_id,user_id) value (NOW(), "tdfgo jest komentarz", 5,2);
insert into Comments (created, text, post_id,user_id) value (NOW(), "1231to jest komentarz", 6,3);
insert into Comments (created, text, post_id,user_id) value (NOW(), "3232to jest komentarz", 7,4);
