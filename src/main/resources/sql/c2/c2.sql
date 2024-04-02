-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS  public.message
(
    message_id serial                                               NOT NULL,
    sender     character varying(50) COLLATE pg_catalog."default"   NOT NULL,
    message    character varying(2000) COLLATE pg_catalog."default" NOT NULL,
    receiver   character varying(50) COLLATE pg_catalog."default"   NOT NULL,
    "time"     character varying COLLATE pg_catalog."default"       NOT NULL,
    CONSTRAINT messages_pkey PRIMARY KEY (message_id)
);


CREATE TABLE IF NOT EXISTS public.users
(
    user_id  serial                                             NOT NULL,
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    role     character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT USER,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT unique_username UNIQUE (username)
);

INSERT INTO public.users
( username, password, role )
VALUES
    ( '@AlL', '1eshtrd92Rgsdg8374ag65', 'system' ),
    ( 'SYSTEM', '1eshtrd92Rgsdg8374ag65', 'system' ),
    ( 'louis', '1234', 'user' );


ALTER TABLE IF EXISTS public.message
    ADD CONSTRAINT sender FOREIGN KEY (sender)
        REFERENCES public.users (username) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;

ALTER TABLE IF EXISTS public.message
    ADD CONSTRAINT receiver FOREIGN KEY (receiver)
        REFERENCES public.users (username) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;



INSERT INTO public.message
    ( sender, message, receiver, "time" )
VALUES
    ( 'louis', 'hej alle sammen!', '@AlL', '20-03-2024 12:40:33' ),
    ( 'jon', 'Hey there!', 'bingo', '20-03-2024 13:15:22' ),
    ( 'bingo', 'Whats up?', 'jon', '20-03-2024 13:17:45' ),
    ( 'ole', 'Hi guys!', '@AlL', '20-03-2024 13:20:10' ),
    ( 'dennis', 'Hello everyone!', '@AlL', '20-03-2024 13:22:58' ),
    ( 'louis', 'Hows everyone doing today?', '@AlL', '20-03-2024 13:25:37' ),
    ( 'jon', 'IM good, thanks ! ', '@AlL', '20-03-2024 13:28:14' ),
    ( 'bingo', 'Just chilling.', '@AlL', '20-03-2024 13:30:45' ),
    ( 'ole', 'Im doing great, thanks for asking!', '@AlL', '20-03-2024 13:33:21' ),
    ( 'dennis', 'IM doing alright, could be better.', '@AlL', '20-03-2024 13:36:02' ),
    ( 'louis', 'Glad TO hear you guys are doing okay.', '@AlL', '20-03-2024 13:38:49' ),
    ( 'jon', 'Anyone up FOR a game later?', '@AlL', '20-03-2024 13:41:25' ),
    ( 'bingo', 'Sure, what game?', '@AlL', '20-03-2024 13:44:17' ),
    ( 'ole', 'Count me IN!', '@AlL', '20-03-2024 13:47:01' ),
    ( 'dennis', 'Im down for some gaming.', '@AlL', '20-03-2024 13:49:42' ),
    ( 'louis', 'Sounds like fun!', '@AlL', '20-03-2024 13:52:30' ),
    ( 'jon', 'How about we play some Among Us?', '@AlL', '20-03-2024 13:55:12' ),
    ( 'bingo', 'Yeah, that sounds great!', '@AlL', '20-03-2024 13:58:07' ),
    ( 'ole', 'I love Among Us! Count me in!', '@AlL', '20-03-2024 14:01:01' ),
    ( 'dennis', 'Sure, IM up FOR SOME impostor ACTION.', '@AlL', '20-03-2024 14:03:59' ),
    ( 'louis', 'Among Us it IS THEN!', '@AlL', '20-03-2024 14:06:58' );

END;