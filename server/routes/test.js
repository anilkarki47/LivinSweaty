let a = {
  data: [
    {
      _id: "6437c41785aef60718ed95e5",
      workoutID: {
        _id: "640655bb8df27e27de690f8e",
        name: "Back Pull",
        count: "3 Sets 12 Reps",
      },
      playlistID: {
        _id: "64300aac10fe1250288d4b89",
        userId: "6405a48fdba9e6ac17ee9757",
        name: "asss",
        __v: 0,
      },
      user: {
        _id: "6405a48fdba9e6ac17ee9757",
        name: "xo",
        email: "xo@xo",
        password:
          "$2a$08$aXPBh4TDdak5KvvtWFt65eAarYXF77yZskSbnBklBxDOM3FSg8Aom",
        type: "user",
        __v: 0,
      },
      date: "2023-04-13T08:57:59.428Z",
      __v: 0,
    },
    {
      _id: "6437c44285aef60718ed95e7",
      workoutID: {
        _id: "6406560f8df27e27de690f91",
        name: "Flat Dumbell Press",
        count: "3 Sets 12 Reps",
      },
      playlistID: {
        _id: "64373acad1bb701a31c41e1d",
        userId: "6405a48fdba9e6ac17ee9757",
        name: "xoxxo",
        __v: 0,
      },
      user: {
        _id: "6405a48fdba9e6ac17ee9757",
        name: "xo",
        email: "xo@xo",
        password:
          "$2a$08$aXPBh4TDdak5KvvtWFt65eAarYXF77yZskSbnBklBxDOM3FSg8Aom",
        type: "user",
        __v: 0,
      },
      date: "2023-04-13T08:58:42.954Z",
      __v: 0,
    },
  ],
};

for (let i = 0; i < a.data.length; i++) {
  a.data[i].workoutID.name;
}
