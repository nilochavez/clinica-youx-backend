PGDMP  7    !        	        |         
   pg_clinica    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16399 
   pg_clinica    DATABASE     �   CREATE DATABASE pg_clinica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE pg_clinica;
                postgres    false            �            1259    16454    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);
 )   DROP TABLE public.flyway_schema_history;
       public         heap    postgres    false            �            1259    16464 	   pacientes    TABLE       CREATE TABLE public.pacientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(255) NOT NULL,
    data_nascimento date,
    peso numeric(5,2),
    altura numeric(3,2),
    uf character(2) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    16463    pacientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pacientes_id_seq;
       public          postgres    false    217                       0    0    pacientes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;
          public          postgres    false    216            �            1259    16474    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    login text NOT NULL,
    senha text NOT NULL,
    cargo text NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16473    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    219                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    218            Z           2604    16467    pacientes id    DEFAULT     l   ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);
 ;   ALTER TABLE public.pacientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            [           2604    16477    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �          0    16454    flyway_schema_history 
   TABLE DATA           �   COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
    public          postgres    false    215   �       �          0    16464 	   pacientes 
   TABLE DATA           \   COPY public.pacientes (id, nome, cpf, data_nascimento, peso, altura, uf, ativo) FROM stdin;
    public          postgres    false    217   .       �          0    16474    usuarios 
   TABLE DATA           ;   COPY public.usuarios (id, login, senha, cargo) FROM stdin;
    public          postgres    false    219                     0    0    pacientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pacientes_id_seq', 8, true);
          public          postgres    false    216                       0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 13, true);
          public          postgres    false    218            ]           2606    16461 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public            postgres    false    215            `           2606    16471    pacientes pacientes_cpf_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_cpf_key UNIQUE (cpf);
 E   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_cpf_key;
       public            postgres    false    217            b           2606    16469    pacientes pacientes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    217            d           2606    16483    usuarios usuarios_login_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_login_key UNIQUE (login);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_login_key;
       public            postgres    false    219            f           2606    16481    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    219            ^           1259    16462    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public            postgres    false    215            �   �   x�m�M
�0@���^ af��3���Pb	R(�&��-�����# JN-˖nS�K��h���t���~V�9�$�8�!�2�v/���Z��h�CDVD��	�%׺�2����o}����7��}�E��X���߼�B� �Bi      �   �  x�u�Mr�@ �u{
n�槡Y*F�ĚB't��r�e.6�Īd1��|_�'�ؑf�%�}&b2�Vl���f�	��z�e���8���=[����).��UȗO2�)4�8(s�T�G��@��n$�UCJZ�Ӥ�IR�E�H�%YՐ���vLc�8�^Z�)���dʯ�S�7�yw�r�Dgv��.v��`\�����'��Y�}����CC׶'��F8��l�=ϫa������w�^�e�ˉI����pʒ�~�4�A�	�_���lZT���o�I��N����T��!�F���a��z���H_���M�T�S��z�HS��xȮ3�Hw6�dx������C���ґ�9�DS�,VD�rL��21'h����Sp����Iږ��?!�^�+��q����QT����,������
m��~[���/F�p�-���?���v��      �   �  x�=�۲rP  �k=G�b)�KVY)T2��B�1=������f>�zG�;ZSK,Yf��c�x�!O#(�a\M���vĬ������g�Q�6��Z�Ҕ�"x\�_k3cn׈8Y*ow(�Ey*��F��F'Y���5|�%Jc�������PeZT�L	=�m?6�S�d��?�� ��P��H-�{���Ǖ�>�V�@�X���Mv�ln�0�=�U�m���I�~ f�
�a�]�>BKCa���$��]��
�8-gK#�s6��Qƞy9E�-K��O�������u�,&]3Z�
u��kI�����=�苯1�s��j�w���aS?��x�dS�e�0��C�i8�n�'G�]���r{V��<<)t���'67�[߾�
\�y(���ԭ�O��.����X,~F��     