PGDMP                      |            lifehack    16.2 (Debian 16.2-1.pgdg120+2)    16.1     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    215   7       -           0    0    food_in_season_food_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.food_in_season_food_id_seq', 412, true);
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
       public            postgres    false    215            #   �  x���ێ�6���O�hA��x�l�i�.����h]am��6d�m޾\�!9��� �'^q��J����޽N�����~�����N�ŇDz�ᢘQ����㦿������[F7��~sxs�����C�	|�6�_��������Ӱ]�/�d����w�����������eL��a�}:Kj�bF$[�q����s��Fp9ǆ�|�xV��7��@2�����@6K������Z|�媒ԥ�mMw�;�R�w���ڗ:ٲW��WI�H6���R��R��R��R�ť��j��(.=]\z��t��t��t�����ҍ�ҭ��ť��e��2��2�x�֛�N�ʧ��ϒJ���������N���~���~�M)�����9)Ɩ���p��r�*���R{�o���U��T���r�{����e�}7���v�R�>�T��m^v���_^��|K���a5�v/�����z��msk�mn]�ͭ����[���;��s�6w�ns�&���6w�osg�m�6�`��۾�6�����m���^1m�u�ͽ�����6��os�4is)�v#}.�l�ѥ�z�K��V�BM���m�4����RX�ݥpl�K��/�k����8t�>����eJIe⋔@��-R�y�n�����t�A����s�z*M���H�K��kJ͐>�V�5E� �:� .G��΂��N۾�A q�߯�fm�!��y��C��<��;���sy�"�v�/i���;��n�-[���@�@C֣!x���\�_u�c��(���|���^~�2���w�՛�n�R�i�|��
��S��8��?��ew�%ˀ����	%4������n�4���M��?�������o��n�U�j`r�V���u����`�Gj�R�L�=�I]�>�A�$A�4?�'��n���	hD ���b�4<��F��#M>��<0h&3�i0�D4��0cPL�a�t��%[�I+*$G�/+�B���E��ep�ޭ-��fo��(a!�LE���2#��[Բ;�cX��򝬱��
9�Yȩ9�d!gj,�,�B����
젮x�b!/�,��B���_ ��k���aY�[�������M!�,B�,�A���8� T��@�*�0�@Zb��҈ <�B �B %�B ��B q��@�,���,��ޟf!�?�� � �X�4�,aR��Bf�,a��6�0c�a!��K��;�QO��<sD�Sw�'��%�M�|Nt�链ﯕ��i#�g�L>-O�۽@��i�\���{�y�H�/���n�<u��o��n{Uu�R� �e-�S�D����Qb��5I�n��1�a7,o�T�I���'o�Z��9|O�&Y*��웢������r�?�T���*g��@WX��~�G�f]����4p��c�#�� ��?�}�uAs��ƺ`����?!*��Ǉ�i�.p���aΝ�S����<����{�=ѹ� �Nfk��º`y��`]�M�[c]�,�m�.��k�.�*�k�.�	��b]p<�cYǺબn�u}�u}�u���6��6����&��I��m���E��.
�uQ�Y�뢘ú(�.�y��b뢘ͺ(f�.�og]�3Y�,�E����r�l�.�:�l�.�6�l�.B�u&X�ͺm�Eh�.B�u*��Pc]�u�X�ź��z�%"�RaP�����0$z�.W7Mߴ1G�]4�J�E�艿a4("�ÐP$�� �QN<�o"ʏ�0���J��3vs��Z�"�z&�x�*�V�PǕ/brӵ(B6���(�H�%_�A%$���?ӊ���fc�
SC�@[6"���5/�s5�#r9��ɬք.������(�$�j�C��v�Q"�q��7-���6��N��>�I�TN/����n����{���J�
����zс�IX���ߒ��[�j�*�Iד��6cAؘ�j9X_��bC��E5�#�r�FA�!����S|D��0o0cI����iM�	���E��*bU8������#ɇ�4�yax��[ex̄�4���X��Z�0A�:�C��TG�M21��0�d�:TQF���&���50L��Ek�ay<Ra�at�
��|;l��X%J�l�_������τ�d%I
k&+)� b�
3�_�/���q_O          E   x�3�����4426�,-N-�2�L��Kχ�$��f�qs��B
�KҋR��L9SR��2�фc���� ���     