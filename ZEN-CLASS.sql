CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [email] nvarchar(255) UNIQUE,
  [role] nvarchar(255)
)
GO

CREATE TABLE [courses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [title] nvarchar(255),
  [description] text,
  [instructor_id] int
)
GO

CREATE TABLE [enrollments] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int,
  [course_id] int
)
GO

CREATE TABLE [sessions] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [course_id] int,
  [title] nvarchar(255),
  [date] datetime
)
GO

CREATE TABLE [assignments] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [course_id] int,
  [title] nvarchar(255),
  [due_date] datetime
)
GO

CREATE TABLE [submissions] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [assignment_id] int,
  [user_id] int,
  [submission_date] datetime,
  [grade] float
)
GO

ALTER TABLE [courses] ADD FOREIGN KEY ([instructor_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [enrollments] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [enrollments] ADD FOREIGN KEY ([course_id]) REFERENCES [courses] ([id])
GO

ALTER TABLE [sessions] ADD FOREIGN KEY ([course_id]) REFERENCES [courses] ([id])
GO

ALTER TABLE [assignments] ADD FOREIGN KEY ([course_id]) REFERENCES [courses] ([id])
GO

ALTER TABLE [submissions] ADD FOREIGN KEY ([assignment_id]) REFERENCES [assignments] ([id])
GO

ALTER TABLE [submissions] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO
