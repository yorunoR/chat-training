const MUTATION = /* GraphQL */ `
  mutation SaveAnswer($question: String!, $answer: String!) {
    saveAnswer(input: { question: $question, answer: $answer }) {
      answerHistory {
        id
      }
    }
  }
`
export default MUTATION
