from sqlalchemy import Column, Integer, String
from database import Base

class Comment(Base):
    __tablename__ = "comments"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, nullable=False)
    comment = Column(String, nullable=False)
    content_id = Column(Integer, nullable=False)
