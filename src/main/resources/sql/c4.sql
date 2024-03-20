PGDMP                      |            lifehack    16.2 (Debian 16.2-1.pgdg120+2)    16.1     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    24595    lifehack    DATABASE     s   CREATE DATABASE lifehack WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE lifehack;
                postgres    false            *           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   pg_database_owner    false    5            �            1259    24608    food_in_season    TABLE        CREATE TABLE public.food_in_season (
    food_month character varying(70) NOT NULL,
    food_category character varying(70) NOT NULL,
    food_item character varying(70) NOT NULL,
    food_description character varying(50),
    food_id integer NOT NULL
);
 "   DROP TABLE public.food_in_season;
       public         heap    postgres    false            �            1259    24607    food_in_season_food_id_seq    SEQUENCE     �   CREATE SEQUENCE public.food_in_season_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.food_in_season_food_id_seq;
       public          postgres    false    218            +           0    0    food_in_season_food_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.food_in_season_food_id_seq OWNED BY public.food_in_season.food_id;
          public          postgres    false    217            �            1259    24597    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(20) DEFAULT USER NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24601    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    215            ,           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    216            �           2604    24611    food_in_season food_id    DEFAULT     �   ALTER TABLE ONLY public.food_in_season ALTER COLUMN food_id SET DEFAULT nextval('public.food_in_season_food_id_seq'::regclass);
 E   ALTER TABLE public.food_in_season ALTER COLUMN food_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    24602    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215            #          0    24608    food_in_season 
   TABLE DATA           i   COPY public.food_in_season (food_month, food_category, food_item, food_description, food_id) FROM stdin;
    public          postgres    false    218   t                  0    24597    users 
   TABLE DATA           B   COPY public.users (user_id, username, password, role) FROM stdin;
    public          postgres    false    215   �       -           0    0    food_in_season_food_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.food_in_season_food_id_seq', 414, true);
          public          postgres    false    217            .           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);
          public          postgres    false    216            �           2606    24613 "   food_in_season food_in_season_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.food_in_season
    ADD CONSTRAINT food_in_season_pkey PRIMARY KEY (food_id);
 L   ALTER TABLE ONLY public.food_in_season DROP CONSTRAINT food_in_season_pkey;
       public            postgres    false    218            �           2606    24604    users unique_username 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_username;
       public            postgres    false    215            �           2606    24606    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            #   
  x����n�6��WO�h!r�/���6Z��W!v�J�M�����!9�{� ����(ݫjP���ʾ��6�Yw��_w,��]��U;�Ԣ�;�����2w�ݶeu������w�I ׭xjٟ��{u��k�uԣ"#ڡ����隶��XNJ?��dI���֯��!&�cݫ��\FJ^��*�I���(x �:���A��i#���r�P��YȬ�y�eȑ�"�1�W0���<�m���I
.y:�F$\���Y��ɼ�N�ܔ�2_q�/��bJ���I�0����T��d��tU��fqHo۾,N��d;c�b�ڶ�r��Q���|��q]���kQ��K��������=��|�k��-�ܷ����<�%�1�ɒ�`\�.w�j�q�
��\0��%��ԧK"�|d��X��Ic��,0O�zI`��u�ƹ]^S��"�����қ90���	3;��aC��a�D(_��aBD��2=L����`�E4`Lܰ�kE��?�o����� ה��>�Ee��ת2��g����s���{_�����	���p�붶`�U\��lRU��s|^���˪��U�٫fT�k��o��@L^��t|K��>j*& z�M�/��3(~!ul&�~2�n��n�S�h~{5�'��}�?N�m
�3䛲���k����%s�6F	����(�c�Y�����k��gU�:\NO��;�D���>��PWwgEq*�r���bG��i.�V�u5�$����a����=����S9�A��F���U<�m��i�+�>���i�tf�y���d"}�XMc[�)[K<0k�#[.�Y�;�e��VYn{#�Kr.�I�������d�%U�`j%Ĩ���!���xB	�w0u*pŃ��Pakl%m��͌���z)��X��5�[I"h��q��"��$�E��d�f�HC�B0c�n�m&�[2o;KUo��$!�V��V��R*lGf�G]Н$�܃�;^,=���`k�y �c� <��H��\܊���lo��N d(��ġ��<\f��`p�B��}�*l<M|ŧV5D	��,����d>�����ꛗ2�X�"^?��������H��Q���^�6�V��
;�R��:�RI���Ҽ��Դ1�0���2F�B���$�� ��Mp02�$ۈF�%���R��#OI��g�G$��ؐ�T��Ș�����le�A1-�^�E�I���Oo"� �Y�	�q>����G�h�o>)c�
=)���ߣ(��*1          E   x�3�����4426�,-N-�2�L��Kχ�$��f�qs��B
�KҋR��L9SR��2�фc���� ���     