const QUERY = /* GraphQL */ `
  query CurrentUser {
    currentUser {
      id
      name
      email
      answerHistories {
        id
        question
        answer
        createdAt
      }
    }
  }
`
export default QUERY
