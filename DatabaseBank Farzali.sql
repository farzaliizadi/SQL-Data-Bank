Create table UserLogins 
(UserLoginID smallint Primary Key,
UserLogin char(15),
UserPassword varchar(20))
Insert into UserLogins values(1234, 'knabardi', 'k4321')
Insert into UserLogins  values(1354, 'fkhoshnam' , 'f4531')
Insert into UserLogins  values(2357,' fizadi' , 'f7532')
Insert into UserLogins  values(2143, 'aafrasiabi', 'a3412' )

Create table UserSecurityQuestions
(UserSecurityQuestionID tinyint Primary Key,
UserSecurityQuestion varchar(50))
Insert into UserSecurityQuestions values(12, 'favourite car') 
Insert into UserSecurityQuestions values(15, 'favourite color') 
Insert into UserSecurityQuestions values(20, 'favourite book') 
Insert into UserSecurityQuestions values(25, 'favourite movie') 

Create table SavingsInterestRates
(InterestSavingsRateID tinyint Primary Key,
InterestValue numeric(9,9),
InterestRateDescription varchar(20))
Insert into SavingsInterestRates values (50, 0.10, 'ten percent')
Insert into SavingsInterestRates values (60, 0.15, 'fifteen percent') 
Insert into SavingsInterestRates values (70, 0.20, 'twenty percent')
Insert into SavingsInterestRates values (80, 0.30, 'thirty percent')

Create table  AccountType 
(AccountTypeID tinyint Primary Key,
AccountTypeDescription varchar(30))
Insert into AccountType values (25, 'saving')
Insert into AccountType values (35, 'checking')
Insert into AccountType values (45, 'saving')
Insert into AccountType values (55, 'checking')

Create table AccountStatusType
(AccountStatusTypeID tinyint Primary Key,
AccountStatusDescription varchar(30))
Insert into AccountStatusType values (100, 'saving')
Insert into AccountStatusType values (110, 'checking')
Insert into AccountStatusType values (120, 'saving')
Insert into AccountStatusType values (130, 'checking')

Create table FailedTransactionErrorType
(FailedTransactionErrorTypeID tinyint Primary Key,
FailedTransactionDescription varchar(50))
Insert into FailedTransactionErrorType values (95, 'pss incorrect')
Insert into FailedTransactionErrorType values (96, 'forgotten ID')
Insert into FailedTransactionErrorType values (97, 'failed login')
Insert into FailedTransactionErrorType values (98, 'incorrect ID')

Create table LoginErrorLog
(ErrorLoginID int Primary Key,
ErrorTime datetime,
FaildTransactionXML xml)
Insert into LoginErrorLog values (61, 'Jan 4, 1980', 'p')
Insert into LoginErrorLog values (71, 'Mar 8, 1990', 'o')
Insert into LoginErrorLog  values (81, 'May 3, 2000', 'v')
Insert into LoginErrorLog  values (91, 'Dec 1, 2001', 'f')

Create table TransActionType
(TransactionTypeID tinyint Primary Key,
TransActionTypeName char(10),
TransActionTyprDescription varchar(50),
TransactionFeeAmount smallmoney)
Insert into  TransActionType values (30, 'withdraw', 'with',5)
Insert into  TransActionType values (40, 'chash' , 'withdr', 10)
Insert into  TransActionType values (50, 'deposit', 'depo', 20)
Insert into  TransActionType values (60,  'saving', 'save' , 30)


Create table Employee
(EmployeeID int Primary Key,
EmployeeFirstName varchar(25),
EmployeeMiddleInitial varchar(1),
EmployeeLastName varchar(25),
EmployeeIsManager bit)
Insert into Employee values (101,'Akb', 'F', 'Sab', 1)
Insert into Employee values (112, 'Bob','G', 'Tob', 0)
Insert into Employee values (121, 'Gosh', 'M', 'Ken',0)
Insert into Employee values (131, 'Far', 'C', 'Mas',1)

Create table FailedTransactionLog
(FailedTransactionID int Primary Key,
FailedTransactionErrorTypeID1 tinyint,
FailedTransactionErrorType datetime,
FailedTransactionXml   xml ,
Foreign Key (FailedTransactionErrorTypeID1) references FailedTransactionErrorType (FailedTransactionErrorTypeID))

Insert into  FailedTransactionLog values (100, 95, 'Jan 4, 1991', 'p')
Insert into  FailedTransactionLog values (110, 96, 'Feb 4, 1980', 'g') 
Insert into  FailedTransactionLog values (120,97, 'Dec 6, 1995', 'h')
Insert into  FailedTransactionLog values (130, 98, 'May 7, 1989', 'j')


Create table Account
(AccountID int Primary Key,
CurrentBalance int,
AccountTypeID1 tinyint,
AccountStatusTypeID1 tinyint,
InterestSavingsRateID1 tinyint,
Foreign Key (AccountTypeID1) references  AccountType (AccountTypeID),
Foreign Key (AccountStatusTypeID1) references  AccountStatusType (AccountStatusTypeID),
Foreign Key (InterestSavingsRateID1) references    SavingsInterestRates (InterestSavingsRateID))

Insert  into Account values (1,100,25,100,50)
Insert into  Account  values (2,100,35,110,60)
Insert into  Account values (3,100,45,120,70)
Insert into  Account values (4,100,55,130,80)

Create table OverDraftLog
(AccountID1 int Primary Key,
OverDraftDate datetime,
OverDraftAmount money,
OverDraftTransactionXml  xml,
Foreign Key (AccountID1) references Account(AccountID))

Insert into OverDraftLog values (1, 1999-01-01 , 200, 'i')
Insert into OverDraftLog values (2, 1990-01-01  , 300, 'y')
Insert into OverDraftLog values (3, 1987-01-01  , 400, 'g')
Insert into OverDraftLog values (4, 1967-01-01 , 500, 'h')

Create table UserSecurityAnswers
(UserLoginID1 smallint Primary Key,
UserSecurityAnswer varchar(25),
UserSecurityQuestionID1 tinyint,
Foreign Key (UserLoginID1) references UserLogins(UserLoginID),
Foreign Key (UserSecurityQuestionID1) references UserSecurityQuestions(UserSecurityQuestionID))

Insert into UserSecurityAnswers values (1234, 'y', 12)
Insert into UserSecurityAnswers values (1354, 'y', 15)
Insert into UserSecurityAnswers values (2357, 'y', 20)
Insert into UserSecurityAnswers values (2143, 'y', 25)

Create table LoginAccount
(UserLoginID1 smallint,
AccountID1 int,
Foreign Key (UserLoginID1) references UserLogins(UserLoginID),
Foreign Key (AccountID1)   references Account(AccountID))

Insert into LoginAccount values (1234,1)
Insert into LoginAccount values (1354,2)
Insert into LoginAccount values (2357,3)
Insert into LoginAccount values (2143,4)

Create table Customer
(CustomerID int Primary Key,
AccountID1 int,
CustomerAddress1 varchar(30),
CustomerAddress2 varchar(30),
CustomerFirstName varchar(30),
CustomerMiddleInitial varchar(1),
CustomerLastName varchar(30),
City char(20),
State char(2),
Zipcode char(10),
EmaiAddress varchar(40),
HomePhone char(10),
CellPhone Char(10),
WorkPhone char(10),
SSN char(9),
UserLoginID1 smallint 
Foreign Key (AccountID1) references Account(AccountID),
Foreign Key (UserLoginID1) references UserLogins(UserLoginID))

 Insert into Customer values (81, 1, ' Fin', ' Les', 'Abe' ,'B', 'Mo','Toronto', 'ON', 
 65432, 'abe@a.com' , 420, 520, 430, 712,1234)

 Insert into Customer values (82, 2, ' Fin', ' Les', 'Abe' ,'B', 'Mo','Toronto', 'ON', 
 65432, 'abe@a.com' , 420, 520, 430, 712,1234)

 Insert into Customer values (83, 3, ' Fin', ' Les', 'Abe' ,'B', 'Mo','Toronto', 'ON', 
 65432, 'abe@a.com' , 420, 520, 430, 712,1234)

 Insert into Customer values (84, 4, ' Fin', ' Les', 'Abe' ,'B', 'Mo','Toronto', 'ON', 
 65432, 'abe@a.com' , 420, 520, 430, 712,1234)

Create table CustomerAccount
(AccountID2 int,
CustomerID1 int,
Foreign Key (AccountID2) references Account(AccountID),
Foreign Key (CustomerID1) references Customer(CustomerID))
Insert into CustomerAccount  values (1, 81)
Insert into CustomerAccount  values (2, 82)
Insert into CustomerAccount  values (3, 83)
Insert into CustomerAccount  values (4, 84)

Create table TransactionLog
(TransactionID int primary Key,
TransactionDate datetime,
TransactionTypeID1 tinyint,
TransactionAmount money,
NewBalance money,
AccountID1 int,
CustomerID2 int,
EmployeeID1 int,
UserLoginID1 smallint,
Foreign Key ( TransactionTypeID1) references  TransactionType(TransactionTypeID),
Foreign Key (CustomerID2) references Customer(CustomerID),
Foreign Key (EmployeeID1) references Employee(EmployeeID),
Foreign Key (UserLoginID1) references UserLogins(UserLoginID))
Insert into TransactionLog values (91, 2001-01-02, 30,  100, 500, 1, 81,101,1234)
Insert into TransactionLog values (92, 2002-01-09, 40,  200, 600, 2, 82,112,1354)
Insert into TransactionLog values (93, 2004-01-02, 50,  300, 700, 3, 83,121,2357)
Insert into TransactionLog values (94, 2007-01-08, 60,  400, 800, 4, 84,131,2143)

select * from TransactionLog