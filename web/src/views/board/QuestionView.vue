<template>
  <main style="max-width: 768px; margin: auto">
    <h2>Question</h2>
    <section>
      <div class="text-left mt-6">
        <p><b>質問を入力してください</b></p>
      </div>
      <Textarea class="w-full p-3" />
      <Button class="w-full mt-3" label="Submit" />
    </section>
    <hr class="my-5" />
    <section class="text-left">
      <div>
        <p><b>回答</b></p>
      </div>
      <p class="border-solid border-1 border-400 p-3">
        回答です1
        <br />
        回答です2
        <br />
        回答です3
        <br />
        回答です4
        <br />
        回答です5
        <br />
        回答です6
        <br />
        回答です7
      </p>
      <Button class="w-full mt-3" label="Save and Clear" />
      <Button class="w-full mt-2" label="Clear" />
    </section>
  </main>
</template>

<script setup lang="ts"></script>
