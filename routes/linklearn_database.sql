PGDMP     '    9            	    y         	   linklearn #   12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)     12.8 (Ubuntu 12.8-1.pgdg18.04+1) )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24646 	   linklearn    DATABASE     {   CREATE DATABASE linklearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE linklearn;
                root    false                        3079    24658 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    41521    category    TABLE     �   CREATE TABLE public.category (
    id_category uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL
);
    DROP TABLE public.category;
       public         heap    root    false    2            �            1259    24907    courses    TABLE     �  CREATE TABLE public.courses (
    id_course uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    level character varying NOT NULL,
    period character varying NOT NULL,
    "classDate" character varying NOT NULL,
    "maxStudent" integer NOT NULL,
    platform character varying NOT NULL,
    "logoCourse" character varying NOT NULL,
    hours character varying NOT NULL,
    id_teacher uuid,
    "startDate" timestamp without time zone NOT NULL,
    "finishDate" timestamp without time zone NOT NULL,
    price numeric(10,2) NOT NULL,
    id_category uuid
);
    DROP TABLE public.courses;
       public         heap    root    false    2            �            1259    24919    feedback    TABLE     �   CREATE TABLE public.feedback (
    description character varying NOT NULL,
    id_course uuid NOT NULL,
    id_student uuid NOT NULL,
    classification numeric(5,2) NOT NULL
);
    DROP TABLE public.feedback;
       public         heap    root    false            �            1259    24828 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    root    false            �            1259    24826    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          root    false    204            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          root    false    203            �            1259    24898    plans    TABLE     �   CREATE TABLE public.plans (
    id_plan uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.plans;
       public         heap    root    false    2            �            1259    24872    students    TABLE     �  CREATE TABLE public.students (
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    cpf character varying NOT NULL,
    gender character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "pictureProfile" character varying NOT NULL,
    "educationLevel" character varying NOT NULL,
    id_student uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "birthDate" timestamp without time zone NOT NULL
);
    DROP TABLE public.students;
       public         heap    root    false    2            �            1259    24916    students_courses    TABLE       CREATE TABLE public.students_courses (
    status boolean DEFAULT false NOT NULL,
    id_course uuid NOT NULL,
    id_student uuid NOT NULL,
    "purchaseDate" timestamp without time zone DEFAULT '2021-10-22 17:25:07.953'::timestamp without time zone NOT NULL
);
 $   DROP TABLE public.students_courses;
       public         heap    root    false            �            1259    24885    teachers    TABLE     �  CREATE TABLE public.teachers (
    id_teacher uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    cpf character varying NOT NULL,
    gender character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "pictureProfile" character varying NOT NULL,
    biography character varying NOT NULL,
    linkedin character varying NOT NULL,
    portifolio character varying NOT NULL,
    contact character varying NOT NULL,
    pix character varying NOT NULL,
    id_plan uuid,
    "birthDate" timestamp without time zone NOT NULL
);
    DROP TABLE public.teachers;
       public         heap    root    false    2            @           2604    24831    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          root    false    203    204    204            �          0    41521    category 
   TABLE DATA           6   COPY public.category (id_category, title) FROM stdin;
    public          root    false    211   �7       �          0    24907    courses 
   TABLE DATA           �   COPY public.courses (id_course, title, description, level, period, "classDate", "maxStudent", platform, "logoCourse", hours, id_teacher, "startDate", "finishDate", price, id_category) FROM stdin;
    public          root    false    208   �8       �          0    24919    feedback 
   TABLE DATA           V   COPY public.feedback (description, id_course, id_student, classification) FROM stdin;
    public          root    false    210   W9       �          0    24828 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          root    false    204   �9       �          0    24898    plans 
   TABLE DATA           C   COPY public.plans (id_plan, title, description, price) FROM stdin;
    public          root    false    207   �:       �          0    24872    students 
   TABLE DATA           �   COPY public.students (name, last_name, cpf, gender, email, password, "pictureProfile", "educationLevel", id_student, "birthDate") FROM stdin;
    public          root    false    205   �:       �          0    24916    students_courses 
   TABLE DATA           Y   COPY public.students_courses (status, id_course, id_student, "purchaseDate") FROM stdin;
    public          root    false    209   �=       �          0    24885    teachers 
   TABLE DATA           �   COPY public.teachers (id_teacher, name, last_name, cpf, gender, email, password, "pictureProfile", biography, linkedin, portifolio, contact, pix, id_plan, "birthDate") FROM stdin;
    public          root    false    206   1>       �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          root    false    203            K           2606    24935 '   students PK_140b19e178a97c6da177a7f3d82 
   CONSTRAINT     o   ALTER TABLE ONLY public.students
    ADD CONSTRAINT "PK_140b19e178a97c6da177a7f3d82" PRIMARY KEY (id_student);
 S   ALTER TABLE ONLY public.students DROP CONSTRAINT "PK_140b19e178a97c6da177a7f3d82";
       public            root    false    205            I           2606    24836 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            root    false    204            O           2606    24906 $   plans PK_8d30de71a3e453cbc749d6dcd29 
   CONSTRAINT     i   ALTER TABLE ONLY public.plans
    ADD CONSTRAINT "PK_8d30de71a3e453cbc749d6dcd29" PRIMARY KEY (id_plan);
 P   ALTER TABLE ONLY public.plans DROP CONSTRAINT "PK_8d30de71a3e453cbc749d6dcd29";
       public            root    false    207            M           2606    24893 '   teachers PK_900aaa6d9eab07a392ed3a77128 
   CONSTRAINT     o   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "PK_900aaa6d9eab07a392ed3a77128" PRIMARY KEY (id_teacher);
 S   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "PK_900aaa6d9eab07a392ed3a77128";
       public            root    false    206            W           2606    41529 '   category PK_9cfdf8d215b7072d300b9bbcafe 
   CONSTRAINT     p   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9cfdf8d215b7072d300b9bbcafe" PRIMARY KEY (id_category);
 S   ALTER TABLE ONLY public.category DROP CONSTRAINT "PK_9cfdf8d215b7072d300b9bbcafe";
       public            root    false    211            U           2606    24943 '   feedback PK_c363e4e75278f746cc2926d1b3f 
   CONSTRAINT     z   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "PK_c363e4e75278f746cc2926d1b3f" PRIMARY KEY (id_course, id_student);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "PK_c363e4e75278f746cc2926d1b3f";
       public            root    false    210    210            Q           2606    24915 &   courses PK_d3fdb27e6f581edcc13ade7aaf3 
   CONSTRAINT     m   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "PK_d3fdb27e6f581edcc13ade7aaf3" PRIMARY KEY (id_course);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "PK_d3fdb27e6f581edcc13ade7aaf3";
       public            root    false    208            S           2606    24939 /   students_courses PK_e31e800428ace872256fc68b389 
   CONSTRAINT     �   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "PK_e31e800428ace872256fc68b389" PRIMARY KEY (id_course, id_student);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "PK_e31e800428ace872256fc68b389";
       public            root    false    209    209            X           2606    24956 '   teachers FK_0c17cbbb057af676c3ebcdc4e8a    FK CONSTRAINT     �   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "FK_0c17cbbb057af676c3ebcdc4e8a" FOREIGN KEY (id_plan) REFERENCES public.plans(id_plan);
 S   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "FK_0c17cbbb057af676c3ebcdc4e8a";
       public          root    false    207    206    2895            ]           2606    24966 '   feedback FK_501948ba56dc676c06a60cba3d1    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "FK_501948ba56dc676c06a60cba3d1" FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "FK_501948ba56dc676c06a60cba3d1";
       public          root    false    208    2897    210            ^           2606    24971 '   feedback FK_79f64a923e8c38c949b8a27e5f6    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "FK_79f64a923e8c38c949b8a27e5f6" FOREIGN KEY (id_student) REFERENCES public.students(id_student);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "FK_79f64a923e8c38c949b8a27e5f6";
       public          root    false    210    2891    205            Z           2606    41531 &   courses FK_8af7746de241987ca7ae6838536    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_8af7746de241987ca7ae6838536" FOREIGN KEY (id_category) REFERENCES public.category(id_category);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "FK_8af7746de241987ca7ae6838536";
       public          root    false    208    2903    211            [           2606    24946 /   students_courses FK_c8c516e1356391d0e1e935e0ff0    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "FK_c8c516e1356391d0e1e935e0ff0" FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "FK_c8c516e1356391d0e1e935e0ff0";
       public          root    false    2897    208    209            Y           2606    24961 &   courses FK_c9ae211023098e9b7bb44f5b473    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_c9ae211023098e9b7bb44f5b473" FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "FK_c9ae211023098e9b7bb44f5b473";
       public          root    false    208    2893    206            \           2606    24951 /   students_courses FK_efd58a7b78e772d9aabbc205e99    FK CONSTRAINT     �   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "FK_efd58a7b78e772d9aabbc205e99" FOREIGN KEY (id_student) REFERENCES public.students(id_student);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "FK_efd58a7b78e772d9aabbc205e99";
       public          root    false    209    205    2891            �   �   x�̻�0 �:�"���J%�,ٜ�`�Q0H#�k���4f[ł� ��`4b[���Z��u��B���z��۾CI�\*j0b�H�>���1r�4�Z���=_��>�I9-6a�~1�9:X�g�Ĉ5R��H�(]�����6 2U      �   �   x�E��J�0�s���-�m�l�	�A� ^�d�I-�F�����s�7c�4Q��c��%(KJ>S�)��՚N���x���?xi�VN�k��Q�{Zۡ�'�o-�5^fD�]K9��e-�ױK�i��4͌��E�M��9BXrP�Ŋu��, ����_�x�y��gR�%e%p����[dNJY4tC�u߉�C�      �   a   x��1� �N���Qo��f�R�m�?}�{\����e;?�wX�^Zqr���Thh7RQw�2�� �2Ќj�8�ѿB��!�/N��b�7�WV      �   �   x�m�Ok�0��s�a�d�t.�\�{qZ�JC
I�����cG�{^����1I�;�ZV�Z�W�֥/è��S�I,�\�u������1o�8�i��m��҄!�P����9/Z�{��{b>3�����@��9�nA��S�:�˽ �)�l�N:����v�4	!m��6 ��,�d���f�� � �hq      �   E   x�KN231KM6�M25��5I46ҵ0N1ӵ4I4LM�L6IL4��I��W0�������z�\1z\\\ g�W      �   �  x����n�8���)z�[��@��h�|t���q�lH &���s̋m�4R۝�d[�td���o�/�`b�}�BY�s"B�����Ӣ`c���uQ~y�]�	.�����
��Q��%��փO:��T�G���??Dّq��S��hl�r��f�UpYW�Iy�g���'������f���Ԉ/�F�I�.@5�fjc4��P���q3�nK���IE)OSʷ*B�¸:�L�?,L���ܷ�d���m��]�3�W�dp�G㙉�����J=�O�oU��ߒ����R#k�A\
�,��5��M��ߘ>�������Z����q=�¯Q��2���~|�D���ƭ�ñ~���S"Km�Lc
#�y��m���l������ٷ&�؋i	��x!e�~�ۦ_Vo��P��B@'�a��c��tS�fv��v�tX�z�^9�Ӻ�܍�6��ϟq1�%S\"�!.زI��Ě��X�����ñ9���LkcN�_iy�s�=�n�5��v����l�/at�M��й�w��P̥�&uK�s�k}���c�e�KXiJ5͍N����~�ŠN%�x�|�K�yS�����]��dCRNӴu=+E��h�AI�{^�M�Z���D٬�t�)��Ă4�,����5(V`���L�X,>&�����r�      �   ~   x��ͻ1��<E�A���x�4�i��6] � ����*�64�� ���ޞ�G�� P�SpYNfUZ�;NA#/ay��'/�f�T�j%�#|'��E��dl��<���|��M�9n~�|�R�H:0�      �     x�͓ˎ�0���)�`�����e�CE�n�	r!$�I_��>ȼXC/RU�J�!�cyq�,�?�K̤��h�� 
p�@@�|D������Z���K�bSJm)�-���R�I��IU������S��U�n�7�a����%k��>�bQ������;���"9�oD�}.�sc�y'�~>D�}Gر6@��>#�h|� ���/$Q��R���� ���`�¶:�*"_ �y 'H�EP���Y�Ui�����JN��B�����2�)Ľ$>���E:{r7c�<�%f��X��Z���^D�>8��?Tqv��Sz�4�M 
�q81
0����E��|.��׈0��@�G�i�>G{џiΧ��V:�|�������n�a]F(��;ޮ(�[NW���M�j�2�P�iw�(.�\ai�n5$�������E��rzVe�a��qy�hW�N��������lB�g��J��S]��y�u�yt�ڹw�o�'���|MX\(     