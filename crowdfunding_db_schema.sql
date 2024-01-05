{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/\
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qDtX9N\
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.\
\
\
CREATE TABLE "campaign" (\
    "cf_id" int   NOT NULL,\
    "contact_id" int   NOT NULL,\
    "company_name" varchar(255)   NOT NULL,\
    "description" varchar   NOT NULL,\
    "goal" float   NOT NULL,\
    "pledged" float   NOT NULL,\
    "outcome" varchar(20)   NOT NULL,\
    "backers_count" int   NOT NULL,\
    "country" varchar(5)   NOT NULL,\
    "currency" varchar(5)   NOT NULL,\
    "launch_date" date   NOT NULL,\
    "end_date" date   NOT NULL,\
    "category_id" varchar(10)   NOT NULL,\
    "subcategory_id" varchar(20)   NOT NULL,\
    "last_updated" timestamp default localtimestamp  NOT NULL,\
    CONSTRAINT "pk_campaign" PRIMARY KEY (\
        "cf_id"\
     )\
);\
\
CREATE TABLE "category" (\
    "category_id" varchar(10)   NOT NULL,\
    "category" varchar(50)   NOT NULL,\
    "last_updated" timestamp default localtimestamp  NOT NULL,\
    CONSTRAINT "pk_category" PRIMARY KEY (\
        "category_id"\
     )\
);\
\
CREATE TABLE "contacts" (\
    "contact_id" int   NOT NULL,\
    "first_name" varchar(100)   NOT NULL,\
    "last_name" varchar(100)   NOT NULL,\
    "email" varchar(100)   NOT NULL,\
    "last_updated" timestamp default localtimestamp  NOT NULL,\
    CONSTRAINT "pk_contacts" PRIMARY KEY (\
        "contact_id"\
     )\
);\
\
CREATE TABLE "subcategory" (\
    "subcategory_id" varchar(20)   NOT NULL,\
    "subcategory" varchar(50)   NOT NULL,\
    "last_updated" timestamp default localtimestamp  NOT NULL,\
    CONSTRAINT "pk_subcategory" PRIMARY KEY (\
        "subcategory_id"\
     )\
);\
\
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")\
REFERENCES "contacts" ("contact_id");\
\
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")\
REFERENCES "category" ("category_id");\
\
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")\
REFERENCES "subcategory" ("subcategory_id");\
\
}