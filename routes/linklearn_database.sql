PGDMP                     	    y         	   linklearn #   12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)     12.8 (Ubuntu 12.8-1.pgdg18.04+1) 2               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24646 	   linklearn    DATABASE     {   CREATE DATABASE linklearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE linklearn;
                root    false                        3079    24658 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false                       0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    41551    cart    TABLE     Y   CREATE TABLE public.cart (
    id_course uuid NOT NULL,
    id_purchase uuid NOT NULL
);
    DROP TABLE public.cart;
       public         heap    root    false            ?            1259    41521    category    TABLE     ?   CREATE TABLE public.category (
    id_category uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL
);
    DROP TABLE public.category;
       public         heap    root    false    2            ?            1259    24907    courses    TABLE       CREATE TABLE public.courses (
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
    id_category uuid,
    "minStudent" integer DEFAULT 0 NOT NULL,
    status character varying DEFAULT 'open'::character varying NOT NULL,
    link character varying
);
    DROP TABLE public.courses;
       public         heap    root    false    2            ?            1259    24919    feedback    TABLE     ?   CREATE TABLE public.feedback (
    description character varying NOT NULL,
    id_course uuid NOT NULL,
    id_student uuid NOT NULL,
    classification numeric(5,2) NOT NULL
);
    DROP TABLE public.feedback;
       public         heap    root    false            ?            1259    24828 
   migrations    TABLE     ?   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    root    false            ?            1259    24826    migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          root    false    204                       0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          root    false    203            ?            1259    24898    plans    TABLE     ?   CREATE TABLE public.plans (
    id_plan uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.plans;
       public         heap    root    false    2            ?            1259    41536    purchase    TABLE     ?  CREATE TABLE public.purchase (
    id_purchase uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "totalPrice" numeric DEFAULT '0'::numeric NOT NULL,
    status character varying DEFAULT 'open'::character varying NOT NULL,
    "typePayment" character varying,
    "dateBuy" timestamp without time zone DEFAULT '2021-10-25 01:28:05.98'::timestamp without time zone NOT NULL,
    id_student uuid NOT NULL
);
    DROP TABLE public.purchase;
       public         heap    root    false    2            ?            1259    24872    students    TABLE     	  CREATE TABLE public.students (
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    cpf character varying NOT NULL,
    gender character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "pictureProfile" character varying NOT NULL,
    "educationLevel" character varying NOT NULL,
    id_student uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "birthDate" timestamp without time zone NOT NULL,
    credit integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.students;
       public         heap    root    false    2            ?            1259    24916    students_courses    TABLE       CREATE TABLE public.students_courses (
    status boolean DEFAULT false NOT NULL,
    id_course uuid NOT NULL,
    id_student uuid NOT NULL,
    "purchaseDate" timestamp without time zone DEFAULT '2021-10-25 01:28:05.099'::timestamp without time zone NOT NULL
);
 $   DROP TABLE public.students_courses;
       public         heap    root    false            ?            1259    24885    teachers    TABLE     ?  CREATE TABLE public.teachers (
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
       public         heap    root    false    2            I           2604    24831    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          root    false    204    203    204            ?          0    41551    cart 
   TABLE DATA           6   COPY public.cart (id_course, id_purchase) FROM stdin;
    public          root    false    213   TE       ?          0    41521    category 
   TABLE DATA           6   COPY public.category (id_category, title) FROM stdin;
    public          root    false    211   ?E       ?          0    24907    courses 
   TABLE DATA           ?   COPY public.courses (id_course, title, description, level, period, "classDate", "maxStudent", platform, "logoCourse", hours, id_teacher, "startDate", "finishDate", price, id_category, "minStudent", status, link) FROM stdin;
    public          root    false    208   kF       ?          0    24919    feedback 
   TABLE DATA           V   COPY public.feedback (description, id_course, id_student, classification) FROM stdin;
    public          root    false    210   ?G       ?          0    24828 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          root    false    204   ?G       ?          0    24898    plans 
   TABLE DATA           C   COPY public.plans (id_plan, title, description, price) FROM stdin;
    public          root    false    207   I       ?          0    41536    purchase 
   TABLE DATA           k   COPY public.purchase (id_purchase, "totalPrice", status, "typePayment", "dateBuy", id_student) FROM stdin;
    public          root    false    212   dI       ?          0    24872    students 
   TABLE DATA           ?   COPY public.students (name, last_name, cpf, gender, email, password, "pictureProfile", "educationLevel", id_student, "birthDate", credit) FROM stdin;
    public          root    false    205   ?I       ?          0    24916    students_courses 
   TABLE DATA           Y   COPY public.students_courses (status, id_course, id_student, "purchaseDate") FROM stdin;
    public          root    false    209   ?L       ?          0    24885    teachers 
   TABLE DATA           ?   COPY public.teachers (id_teacher, name, last_name, cpf, gender, email, password, "pictureProfile", biography, linkedin, portifolio, contact, pix, id_plan, "birthDate") FROM stdin;
    public          root    false    206   ZM                  0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);
          public          root    false    203            [           2606    24935 '   students PK_140b19e178a97c6da177a7f3d82 
   CONSTRAINT     o   ALTER TABLE ONLY public.students
    ADD CONSTRAINT "PK_140b19e178a97c6da177a7f3d82" PRIMARY KEY (id_student);
 S   ALTER TABLE ONLY public.students DROP CONSTRAINT "PK_140b19e178a97c6da177a7f3d82";
       public            root    false    205            i           2606    41545 '   purchase PK_6aa8fa0d372981adc4bac16c7fe 
   CONSTRAINT     p   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT "PK_6aa8fa0d372981adc4bac16c7fe" PRIMARY KEY (id_purchase);
 S   ALTER TABLE ONLY public.purchase DROP CONSTRAINT "PK_6aa8fa0d372981adc4bac16c7fe";
       public            root    false    212            Y           2606    24836 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            root    false    204            _           2606    24906 $   plans PK_8d30de71a3e453cbc749d6dcd29 
   CONSTRAINT     i   ALTER TABLE ONLY public.plans
    ADD CONSTRAINT "PK_8d30de71a3e453cbc749d6dcd29" PRIMARY KEY (id_plan);
 P   ALTER TABLE ONLY public.plans DROP CONSTRAINT "PK_8d30de71a3e453cbc749d6dcd29";
       public            root    false    207            ]           2606    24893 '   teachers PK_900aaa6d9eab07a392ed3a77128 
   CONSTRAINT     o   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "PK_900aaa6d9eab07a392ed3a77128" PRIMARY KEY (id_teacher);
 S   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "PK_900aaa6d9eab07a392ed3a77128";
       public            root    false    206            g           2606    41529 '   category PK_9cfdf8d215b7072d300b9bbcafe 
   CONSTRAINT     p   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9cfdf8d215b7072d300b9bbcafe" PRIMARY KEY (id_category);
 S   ALTER TABLE ONLY public.category DROP CONSTRAINT "PK_9cfdf8d215b7072d300b9bbcafe";
       public            root    false    211            e           2606    24943 '   feedback PK_c363e4e75278f746cc2926d1b3f 
   CONSTRAINT     z   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "PK_c363e4e75278f746cc2926d1b3f" PRIMARY KEY (id_course, id_student);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "PK_c363e4e75278f746cc2926d1b3f";
       public            root    false    210    210            a           2606    24915 &   courses PK_d3fdb27e6f581edcc13ade7aaf3 
   CONSTRAINT     m   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "PK_d3fdb27e6f581edcc13ade7aaf3" PRIMARY KEY (id_course);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "PK_d3fdb27e6f581edcc13ade7aaf3";
       public            root    false    208            c           2606    24939 /   students_courses PK_e31e800428ace872256fc68b389 
   CONSTRAINT     ?   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "PK_e31e800428ace872256fc68b389" PRIMARY KEY (id_course, id_student);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "PK_e31e800428ace872256fc68b389";
       public            root    false    209    209            k           2606    41555 #   cart PK_eaef60c7e3e69bc8fd685439f59 
   CONSTRAINT     w   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_eaef60c7e3e69bc8fd685439f59" PRIMARY KEY (id_course, id_purchase);
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "PK_eaef60c7e3e69bc8fd685439f59";
       public            root    false    213    213            l           2606    24956 '   teachers FK_0c17cbbb057af676c3ebcdc4e8a    FK CONSTRAINT     ?   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "FK_0c17cbbb057af676c3ebcdc4e8a" FOREIGN KEY (id_plan) REFERENCES public.plans(id_plan);
 S   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "FK_0c17cbbb057af676c3ebcdc4e8a";
       public          root    false    207    2911    206            u           2606    41564 #   cart FK_3fb5c963d807b8c3403986528fe    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_3fb5c963d807b8c3403986528fe" FOREIGN KEY (id_purchase) REFERENCES public.purchase(id_purchase);
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "FK_3fb5c963d807b8c3403986528fe";
       public          root    false    212    213    2921            t           2606    41559 #   cart FK_45c3e85e1f1645e3d3c298371da    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_45c3e85e1f1645e3d3c298371da" FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 O   ALTER TABLE ONLY public.cart DROP CONSTRAINT "FK_45c3e85e1f1645e3d3c298371da";
       public          root    false    2913    208    213            q           2606    24966 '   feedback FK_501948ba56dc676c06a60cba3d1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "FK_501948ba56dc676c06a60cba3d1" FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "FK_501948ba56dc676c06a60cba3d1";
       public          root    false    2913    208    210            s           2606    41546 '   purchase FK_688a6def8751c5428c21ecc1378    FK CONSTRAINT     ?   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT "FK_688a6def8751c5428c21ecc1378" FOREIGN KEY (id_student) REFERENCES public.students(id_student);
 S   ALTER TABLE ONLY public.purchase DROP CONSTRAINT "FK_688a6def8751c5428c21ecc1378";
       public          root    false    2907    212    205            r           2606    24971 '   feedback FK_79f64a923e8c38c949b8a27e5f6    FK CONSTRAINT     ?   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT "FK_79f64a923e8c38c949b8a27e5f6" FOREIGN KEY (id_student) REFERENCES public.students(id_student);
 S   ALTER TABLE ONLY public.feedback DROP CONSTRAINT "FK_79f64a923e8c38c949b8a27e5f6";
       public          root    false    205    210    2907            n           2606    41531 &   courses FK_8af7746de241987ca7ae6838536    FK CONSTRAINT     ?   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_8af7746de241987ca7ae6838536" FOREIGN KEY (id_category) REFERENCES public.category(id_category);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "FK_8af7746de241987ca7ae6838536";
       public          root    false    208    2919    211            o           2606    24946 /   students_courses FK_c8c516e1356391d0e1e935e0ff0    FK CONSTRAINT     ?   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "FK_c8c516e1356391d0e1e935e0ff0" FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "FK_c8c516e1356391d0e1e935e0ff0";
       public          root    false    209    208    2913            m           2606    24961 &   courses FK_c9ae211023098e9b7bb44f5b473    FK CONSTRAINT     ?   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_c9ae211023098e9b7bb44f5b473" FOREIGN KEY (id_teacher) REFERENCES public.teachers(id_teacher);
 R   ALTER TABLE ONLY public.courses DROP CONSTRAINT "FK_c9ae211023098e9b7bb44f5b473";
       public          root    false    208    2909    206            p           2606    24951 /   students_courses FK_efd58a7b78e772d9aabbc205e99    FK CONSTRAINT     ?   ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT "FK_efd58a7b78e772d9aabbc205e99" FOREIGN KEY (id_student) REFERENCES public.students(id_student);
 [   ALTER TABLE ONLY public.students_courses DROP CONSTRAINT "FK_efd58a7b78e772d9aabbc205e99";
       public          root    false    2907    205    209            ?   b   x??̱1????</@???_??;p???̠JťZ	?sOd???T??vK%B惖?h]??c?Ql>cވ?
eܐ?}U??C????c? "?'4      ?   ?   x?̻?0 ?:?"???J%?,ٜ?`?Q0H#?k???4f[ł? ??`4b[???Z??u??B????z??۾CI?\*j0b?H?>???1r?4?Z???=_??>?I9-6a?~1?9:X?g?Ĉ5R??H?(]?????6 2U      ?     x?ݐ?N?0E??W?&;vl??
$D?@?4~?7???*q?????G??=3??C???A2?Q)???I`?K?????R?9?㾸???>/{???˞???{?s???9?ܾ?n?n???i?BY#,?R?[???4???4?%T?T??~t8?4DKAx?@?Hih?8?3A?e???>Eߓ?e????8?d-G?|???8?T?m;?N????z
?˙???p?Fh=H#??	U??"z??u?Λ?&???!?y?&???욦??	?+      ?   a   x??1? ?N???Qo??f?R?m??}?{\????e;??wX?^Zqr???Thh7RQw?2?? ?2Ќj??8?ѿB??!?/N???b?7?WV      ?     x?m?Ak?0??s?c?dK?|.?\?{q[??B
I??縞?????|$?ܑ???G?l?ۍ)??0߯i??c<?i@? 8?j?BS?|?????U??Ή?~??a??k?hB?b<?zw??Sj??A?'F??hן???23??9 ??{J?s?|?A@X?q???}?>?_???iՀ??D|>m?ڀ̂9+Ȍ?ƫd+h?;??L@\m~?e[?&?rIBF???j[򿖭q??????a?V???P??|?$??%8??????      ?   E   x?KN231KM6?M25??5I46ҵ0N1ӵ4I4LM?L6IL4??I??W0???????z?\1z\\\ g?W      ?   j   x???1?خ?t?$[g?j!?G78! ?v?j?kL??jU#qi???he%?{???+?O??Kab??|?]??-)???A=&?rw-??P??ӡ??G??? J      ?   ?  x????R?0???^x???6?+A? 
?7iz??????F>?/????Y]f?N2s?'?????6K??Nיue??D?:mM??i??BǉN?4;?/]?-?3?ϰ<?????Sݚ??mPy?Q????<?!????n?????+?}?_?f?Y??$N??/??E?[?F??Uj?n??b	y???T2???'?????? ?|H?O??D??)%?0.??On3??rpQJ?????.B???0??T??N???????y?j?]???k?????u=??@?z?z;?????[W??%?˦8???i?+?=???	 `\b`??J?"?|??????f???|?³?x6?? n??s{?@?????G?ZWn7???ݣL&R/B??q?#Tn˸pXƤ#)???TM`W?1??KJ?*?\?ؿ.?m???~??EśA?1_?ƣ??d????tUmc??.??z?A??U???pp??$4??Eo,?$????N??_F???ZE?'(!????o5'e?gTm?W???b?&Y??+?A:J?;-?G?`OS??bm???`>Hs??h? ?̊h?BTy~?$=?ŗ(?66??|Oj?8ݻ`??[?)?eW?FݮG???X&w????e?`?Ll7???pp????m?گ׶?=%c<)HT?? .}???a???3?/d?ݓ??߅Q?)      ?   ?   x??ͽ?1?x??k@???ˮ?˖?/?????00?|?*????y??pQ?G?na?'g??? {:?4?%???s?!?v?"?R;?cr????CmsE?g????:??????X?g?Hk	#?1?h5?]Evk??k??N?Ql?mΠ?h? ?w?9?ɶ?i???????)aI      ?   s  x?ݓ?n1???Sp?Ջ=;??)U?TE	QD????ٰ??Y????????p?=!q?4c?0#˟~??l?JbJQ?U(}H?Թ?U?Q?X8???xK??q??c?B???є?????e??lҸK????n^??u?gؿ???w?>?L׺[???u????-Wk??/?>?????Ʈ/?l????kh???D?-'+?/?Z???V$?1$$2B?४垁~?T??6d;????D?A??b??S??wY\͉&q1?????$??͑?>?8	F???w|?2r??I?@5FQUD??45>&G?5?SD ?D??@C???YmN'MU/?l?L\w?9??|?N?j???????jG???iK?8?*s?????b??e)Y     