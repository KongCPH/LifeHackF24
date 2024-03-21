PGDMP  
        	            |            lifehack    16.2 (Debian 16.2-1.pgdg120+2)    16.1     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public            postgres    false    215            #     x����n�8���O�'XXg�2��]�M$X�F�j3F<��C�y���$J���@�/��P��۶+��e��]�\��]ә����A��N�b�P�|������?e>��q���?Mו��x����h
c�8�øu�+��N� Ps��N��@1uui�i����iXLa�V%n�!��������r��m[�~�"d�Fw3� �<*"�M�r�%�%�O��Iw�	q}.�����y�q����5���@�B!Y�b�1�fנ��2������t�O'�l���x׍}o���o��ʜ��~��l)G�c^��,E�}3衙�e�<�]]���.��G�D��P��ukL����Ћ �9p��K� �ؖ��3��#c���XL�I���X����Y����f��u�eqn^fۊĊ��fN��kN�[���q�zr!"� )�Ȑ�A�B�b"$�|�B"$ "Bӭ���fGX�YO��Rp��Vk��~��lkE-�J�e�14��ō;��=�o���ܰ��i�^�R�B��:���{��̩г넳�Ѵ��؎��A��gS�F��&�J��n�g�;�y�L�C�?�P�BχlW��A�|m~��H���X����Y׃�|)5۟��xWA�*p���+ʺ�)Y��|g p��N���	o��Jt����.^����»�"r��vl��~lR*=�M�}�}�M�<���nz|qi��,�v�̇����"#���1�%2)`O�w�)r��Y�,� �K'�<����Eq^ko���O��59Ĺou���7�����ݽ�8������:ϾIQ�d�k�ط�rD�d��)�fr����\�qǏ�!�c��ؐm{�y:2)�zVebgX�-#�Y�2����R��Sʇn)���Ek�4��b9��Z���ŚKl�1W���cLa���m���@f{m��{�]/����B�n{h7��-W��l�|�q����ZH\�*yo�7v"�oCDv"�o�M=��,��?���'��}�O:�X��J�x �'Uq^�����*<�E�"�5��xY(�����c�kh\�P���
Ak��g$����F`>c����YDC�yI�y���Ǣ�6'�GۧNv���Ʌ��lq�p�����mo�c�~��/e=w�U�@����^{������L�]'ٞĥ#�d�G&Q�)\3�e�'.%Y�*@N�_���Z!�����S�j���|���S�
��<����#Q�KOU���$I��G&          E   x�3�����4426�,-N-�2�L��Kχ�$��f�qs��B
�KҋR��L9SR��2�фc���� ���     