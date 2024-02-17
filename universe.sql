PGDMP     :                    |            universe    15.4    15.4 /    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    90323    universe    DATABASE     �   CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE universe;
                postgres    false            �            1259    90324    galaxy    TABLE       CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    distance_from_earth numeric,
    galaxy_types text,
    has_life boolean,
    galaxy_type_id integer
);
    DROP TABLE public.galaxy;
       public         heap    postgres    false            �            1259    90329    galaxy_id_seq    SEQUENCE     �   CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.galaxy_id_seq;
       public          postgres    false    214            3           0    0    galaxy_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
          public          postgres    false    215            �            1259    90330    galaxy_types    TABLE     �   CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean
);
     DROP TABLE public.galaxy_types;
       public         heap    postgres    false            �            1259    90333    galaxy_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.galaxy_types_id_seq;
       public          postgres    false    216            4           0    0    galaxy_types_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;
          public          postgres    false    217            �            1259    90334    moon    TABLE     �   CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    planet_id integer
);
    DROP TABLE public.moon;
       public         heap    postgres    false            �            1259    90337    moon_id_seq    SEQUENCE     �   CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.moon_id_seq;
       public          postgres    false    218            5           0    0    moon_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;
          public          postgres    false    219            �            1259    90338    planet    TABLE     �   CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    has_life boolean,
    star_id integer
);
    DROP TABLE public.planet;
       public         heap    postgres    false            �            1259    90341    planet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.planet_id_seq;
       public          postgres    false    220            6           0    0    planet_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;
          public          postgres    false    221            �            1259    90342    star    TABLE     �   CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    galaxy_id integer,
    has_life boolean
);
    DROP TABLE public.star;
       public         heap    postgres    false            �            1259    90345    star_id_seq    SEQUENCE     �   CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.star_id_seq;
       public          postgres    false    222            7           0    0    star_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;
          public          postgres    false    223            y           2604    90346    galaxy galaxy_id    DEFAULT     m   ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);
 ?   ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
       public          postgres    false    215    214            z           2604    90347    galaxy_types galaxy_types_id    DEFAULT        ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);
 K   ALTER TABLE public.galaxy_types ALTER COLUMN galaxy_types_id DROP DEFAULT;
       public          postgres    false    217    216            {           2604    90348    moon moon_id    DEFAULT     g   ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);
 ;   ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
       public          postgres    false    219    218            |           2604    90349    planet planet_id    DEFAULT     m   ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);
 ?   ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
       public          postgres    false    221    220            }           2604    90350    star star_id    DEFAULT     g   ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);
 ;   ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
       public          postgres    false    223    222            #          0    90324    galaxy 
   TABLE DATA           �   COPY public.galaxy (galaxy_id, name, age_in_millions_of_years, star_in_galaxy, distance_from_earth, galaxy_types, has_life, galaxy_type_id) FROM stdin;
    public          postgres    false    214   V4       %          0    90330    galaxy_types 
   TABLE DATA           G   COPY public.galaxy_types (galaxy_types_id, name, has_life) FROM stdin;
    public          postgres    false    216   �4       '          0    90334    moon 
   TABLE DATA           b   COPY public.moon (moon_id, name, age_in_millions_of_years, star_in_galaxy, planet_id) FROM stdin;
    public          postgres    false    218   ,5       )          0    90338    planet 
   TABLE DATA           n   COPY public.planet (planet_id, name, age_in_millions_of_years, star_in_galaxy, has_life, star_id) FROM stdin;
    public          postgres    false    220   6       +          0    90342    star 
   TABLE DATA           l   COPY public.star (star_id, name, age_in_millions_of_years, star_in_galaxy, galaxy_id, has_life) FROM stdin;
    public          postgres    false    222   �6       8           0    0    galaxy_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);
          public          postgres    false    215            9           0    0    galaxy_types_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.galaxy_types_id_seq', 3, true);
          public          postgres    false    217            :           0    0    moon_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.moon_id_seq', 20, true);
          public          postgres    false    219            ;           0    0    planet_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.planet_id_seq', 13, true);
          public          postgres    false    221            <           0    0    star_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.star_id_seq', 6, true);
          public          postgres    false    223                       2606    90352    galaxy galaxy_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
       public            postgres    false    214            �           2606    90354    galaxy galaxy_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
 <   ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
       public            postgres    false    214            �           2606    90356 "   galaxy_types galaxy_types_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.galaxy_types DROP CONSTRAINT galaxy_types_name_key;
       public            postgres    false    216            �           2606    90358    galaxy_types galaxy_types_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);
 H   ALTER TABLE ONLY public.galaxy_types DROP CONSTRAINT galaxy_types_pkey;
       public            postgres    false    216            �           2606    90360    moon moon_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
       public            postgres    false    218            �           2606    90362    moon moon_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);
 8   ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
       public            postgres    false    218            �           2606    90364    planet planet_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
       public            postgres    false    220            �           2606    90366    planet planet_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);
 <   ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
       public            postgres    false    220            �           2606    90368    star star_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
       public            postgres    false    222            �           2606    90370    star star_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
 8   ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
       public            postgres    false    222            �           2606    90371    moon moon_planet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
 B   ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
       public          postgres    false    218    3213    220            �           2606    90376    planet planet_star_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
 D   ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
       public          postgres    false    3217    220    222            �           2606    90381    star star_galaxy_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
 B   ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
       public          postgres    false    222    3201    214            #   �   x�]�A� ����=A��K7���b������E�f��|y
O�x?n
$�����X�1�Jhp�y~ϰ���:��V��@������	�9&>�������� ��LM�,Ɛ�a�m��.�� � 9l      %   1   x�3�,.�,J��,�2�L���,(�Ls�93��R�Ks�8Ӹb���� E+\      '   �   x�U�M�� ����a&*�]zSњ�@���i�^򄟷 �;�Î����Y����7=�K��x��A69@���Xy�G�:����"�^�o8������h�.cT�,�-�G��kJEB{eR�N��v�Ym>͂�%�$XT�S�:�+e_g�"i�ȱH���H#$���0\�����t���_�Μ�g��j�tg.�f�|UZ�>��|�t]�q�[�      )   �   x�E�K�0���0��wa#�hZ���cg�4�y��I�β�|1�%���<@�b���I3:���{���<�zn�y�F�XT���8MP�~�O3�EӁ�<nΗ�#a&��My�&fy��,�m'�V���e��V����ͧZ��i��9?      +   m   x�5�A
�0F���È����K7#�E�$z|%��y�G��~�dG�5�����V��=7���Wd��ۤ�%�xj�����#�?�o`�0A�j�&��Q��gp�]��"z     